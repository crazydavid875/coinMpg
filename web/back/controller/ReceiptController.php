<?php
class ReceiptController{
    private $receiptRepo;
    private $event;
    public function __construct(){
        $this->receiptRepo = new ReceiptRepo();
    }
    function GetRecepitPDF($id){
        //pdf
        $receiptRepo = $this->receiptRepo;
        $receipt = $receiptRepo->find($id);
        $pdf = new pdfMaker();
        $pdf->getPdf($receipt->dist);
    }
   
    function createRecepit($uid){
        
        
        $receiptRepo = $this->receiptRepo;
        $memberRepo = new MemberRepo();
        $user = $memberRepo->find($uid);
        $username = $user->name;
        $recordRepo = new RecordRepo();
        $records = $recordRepo->findAll($uid,true);
        $payitemRepo = new PayItemRepo();
        $articleRepo = new ArticleRepo();
        $myarticle = $articleRepo->findAll($uid);
        
        foreach($records as $record){
            //if($record->getIspay()){
                
                $record->items = $payitemRepo->findAll($record->id);
                foreach($record->items as $item){

                    if($item->receiptid==''
                        &&($item->paymode == 'has article'
                    ||$item->paymode == 'without article')){
                        
                        //get article 
                        $atitle = '';
                        $amt = $item->getTotal();
                        
                        if(isset($item->aid)&&$item->aid!=''){
                            
                            $item->article = $articleRepo->find($item->aid);
                            
                            $atitle = $item->article->title;
                            $allPay = $payitemRepo->findByArticle($item->aid);
                            $total = 0;
                            foreach($allPay as $ap){
                                $total+=$ap->getTotal();
                            }
                            $amt = $total;
                        }
                        else if(count($records)>1){
                            continue;
                        }
                        //else if(count($myarticle)>=1){//if user has article
                        //    continue;
                        //}
                        
                        //create receipt in database
                                                
                        $datetime =time();
                        $data = array('datetime'=>$datetime,'total'=>$amt,'articleTitle'=>$atitle  );
                        
                        $insertid = $receiptRepo->insert($uid,new Receipt($data));
                        //create receipt in filesys
                        $no = sprintf("1%07d",$insertid);$title = $record->receiptitle;
                        $amt = number_format($amt);//
                        $paper =$atitle ;
                        $prticipant = $username;
                        $date = date("Y.m.d",$datetime) ;
                        $pdf = new pdfMaker();
                        $pdf->createpdf($no,$title,$amt,$prticipant,$paper,$date);
                        //update itemnum
                        $payitemRepo->update($item->id,array("receiptid"=>$insertid));
                        //update dist
                        $receiptRepo->updateDist($insertid,$no);
                    }
                }
            //}
        }
        //$this->ListRecepit();
    }
    function ListRecepit(){
        //顯示使用者收據
        $receiptRepo = $this->receiptRepo;
        $uid = Input::getSession("USERID");
        $receipt = $receiptRepo->findAll($uid);
        Output::Success(json_encode($receipt));
    }
    function RemakeReceipt($id){
        $no;//receipt.dist
        $receiptTitle;//record.title
        $amount;//receipt.total
        $username;//user.name
        $paper;//receipt article title
        $date;//receipt datetime
        //find receipt
        $receiptRepo = $this->receiptRepo;
        $receipt = $receiptRepo->find($id);
        $uid = $receipt->uid;
        $no = $receipt->dist;
        $amount = number_format($receipt->total);
        $paper = $receipt->articleTitle;
        $datetime =date("Y.m.d", $receipt->datetime);
        //find username
        $memberRepo = new MemberRepo();
        $user = $memberRepo->find($uid);
        $username = $user->name;
        $receiptTitle =   $receiptRepo->findReceiptTitle($id);

        //remake 
        $pdf = new pdfMaker();
        $pdf->createpdf($no,$receiptTitle,$amount,$username,$paper,$datetime);
    }
}