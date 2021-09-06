<?php
class PaymenyController{
    private $recordRepo;
    public function __construct(){
        $this->recordRepo = new RecordRepo();
    }
    function GetpayAmt($id){
        $data = Input::getJsonData();
        $record = $this->recordRepo->find($id);
        $payitemRepo = new PayItemRepo();
        $record->items = $payitemRepo->findAll($record->id);
        $record->getTotal();
        Output::Success(json_encode($record));
    }
    function getMPGRecord($id){
        $data = Input::getJsonData();
        
        $paytype = $data["paytype"];
        $receipt  = $data["receipt"];

        $uid = Input::getSession("USERID");
        $memberRepo = new MemberRepo();
        $member = $memberRepo->find($uid);
        $email = $member->email;
        $record = $this->recordRepo->find($id);
        $payitemRepo = new PayItemRepo();
        $record->items = $payitemRepo->findAll($record->id);
        
        $orderId = $record->id;
        $ItemName = $record->des;
        $amt = $record->getTotal();
        
        Output::Success(MPG::mpg_encrypt($email,$orderId,$ItemName,$amt,$paytype));
    }
    function PayAll(){
        //delet add return id 
        $uid = Input::getSession("USERID");
        $memberRepo = new MemberRepo();
        $recordRepo = $this->recordRepo;
        $articleRepo = new ArticleRepo();
        $payItemRepo = new PayItemRepo();
        $memberBuilder= new MemberBuilder($memberRepo,$articleRepo,$recordRepo,$payItemRepo);
        $member = $memberBuilder->Build($uid);

        $newRecord = new Record(array('createtime'=>time(),'des'=>'Payment'));
        $insertid = $recordRepo->insert($uid,$newRecord);
        

        $records = $member->paymentRecords;
        
        
        foreach($records as $record){
            if(!$record->getIspay()){
                $payItems = $payItemRepo->findAll($record->id);
                foreach($payItems as $payitem){
                    $payItemRepo->update($payitem->id,array('rid'=>$insertid));
                }
                $recordRepo->delete($record->id);
            }
        }
        
        Output::Success('{"id":"'.$insertid.'"}');
        
    }
    function payNotify(){
        //接收api之街口
    
        $data = Input::getPostData();
        $memberRepo =  new MemberRepo();
        $deTradeInfo = $data['TradeInfo'];
        
        $jsoninfo = json_decode(MPG::mpg_decrypt($deTradeInfo));
        //print_r($jsoninfo);
        //$myfile = fopen("log".time().".txt", "w");
        //$txt = json_encode($data)."\n\n";
        //fwrite($myfile, $txt);
        //fclose($myfile);
        //print_r($jsoninfo) $jsoninfo->Status=='SUCCESS'
        if($jsoninfo->Status=='SUCCESS'){//$jsoninfo->Status=='SUCCESS'

            $jsonResult = $jsoninfo->Result;
            $oid = $jsonResult->MerchantOrderNo;
            $amt = $jsonResult->Amt;
            $paytime = strtotime($jsonResult->PayTime);
            $this->recordRepo->update($oid,array('paytime'=>$paytime));
            //$oid = $data['oid'];
            //$amt = $data['amt'];
            $member = $memberRepo->findByRecord($oid);
            $email = $member->email;
            $name = $member->name;
            $position = $member->position;


            $postdata = http_build_query(
                array(
                    'email' => $email,
                    'pwd' => 'dav123aaxxccee',
                    'type' => 'receipt',
                    'name'=>$name,
                    'position'=>$position,
                    'amt'=>$amt
                )
            );
            $opts = array('http' =>
                array(
                    'method' => 'POST',
                    'header' => 'Content-type: application/x-www-form-urlencoded',
                    'content' => $postdata
                )
            );
            $context = stream_context_create($opts);
            $result = file_get_contents('https://script.google.com/macros/s/AKfycbyktp1CtC_NT6NNegZTDuA0AuVrvswTcZIU_Yj25RcnBKsCxt-3a8X-qrmnVnfPS59V/exec', false, $context);
            Output::Success($result);
        }
        else{
            Output::Error();
        }
    }

    function getPayRecord(){
        //顯示付款資訊
        $uid = Input::getSession("USERID");
        $records = $this->recordRepo->findAll($uid);
        $payitemRepo = new PayItemRepo();
        foreach($records as $record){
            $record->items = $payitemRepo->findAll($record->id);
            $record->getTotal();
        }
        Output::Success(json_encode($records));
    }
    function setPayRecord($id){
        $uid = Input::getSession("USERID");
        $data = Input::getJsonData();
        //find record in member 
        $paytime = time();
        $this->recordRepo->update($id,array('paytime'=>$paytime));
        Output::Success();
    }
    function GetPDFPayRecord($sql){
       //pdf
    }
    
    
}