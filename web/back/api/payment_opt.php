<?php
function run($sql,$action){
    //$_SESSION['userID'] = isset($_SESSION['userID'])?$_SESSION['userID']:-1;
    if($_SERVER['REQUEST_METHOD']=='POST'){
        switch ($action) {
            case 'payRecord':
                $response = payRecordAdd($sql);
                break;
            case 'payNotify':
                $response = payNotify($sql);
                break;
            default:
                $response['code'] = 404;
                $response['value'] = 'action not found';
                break;
        }
    }   
    else if($_SERVER['REQUEST_METHOD']=='GET'){
        switch ($action) {
            case 'amt':
                $response = GetpayAmt($sql);
                break;
            case 'record':
                $response = getPayRecord($sql);
                break;
            default:
                $response['code'] = 404;
                $response['value'] = 'action not found';
                break;
        }
    }
    http_response_code($response['code']);
    echo $response['value'];
}
function GetpayAmt($sql){
    //看有沒有論文、有沒有繳過費，回傳應繳費金額
    $member = GetUser();
    $articles = $sql->SelectArticles($member);
    $articleCount = $sql->GetMsg();
    $records = $sql->SelectPaymentRecords($member);
    $recordsCount = $sql->GetMsg();
    if($recordsCount<=0 && $articleCount<=0 ){
        $mode = $sql->SelectPayMode("沒有論文");
        $response['code'] = 200;
        $response['value'] = $mode['amt'];
    }
    else if($recordsCount<=0 && $articleCount==1){
        $mode = $sql->SelectPayMode("有論文");
        $response['code'] = 200;
        $response['value'] = $mode['amt'];
    }
    else if($recordsCount>0){
        $response['code'] = 200;
        $response['value'] = $records[0]['amt'];
    }
    else{
        $response['code'] = 400;
        $response['value'] = 'nothing to pay';
    }
    return $response;
}

function payRecordAdd($sql){
    //加密+回傳資料
    
    $member = GetUser();
    $member = $sql->SelectArticles($member);
    $articles = $member->getArticles();
    $articleCount = $sql->GetMsg();
    $records = $sql->SelectPaymentRecords($member);
    $recordsCount = $sql->GetMsg();
    $ItemName = '';
    if($recordsCount<=0 && $articleCount<=0 ){
        $ItemName = "沒有論文";
        $paymode = $sql->SelectPayMode($ItemName);
        $orderId = $sql->InsertPayRecord($member,$paymode['id'],$paymode['amt']);
        if($orderId==-1){
            $response['code'] = 400;
            $response['value'] = $sql->GetMsg();
            return $response;
        }
        $amt = $paymode['amt'];
    }
    else if($recordsCount<=0 && $articleCount==1){
        $ItemName = "有論文";
        $paymode = $sql->SelectPayMode($ItemName);
        
        $orderId = $sql->InsertPayRecord($member,$paymode['id'],$paymode['amt']);
        if($orderId==-1){
            $response['code'] = 400;
            $response['value'] = $sql->GetMsg();
            return $response;
        }
        $sql->SetArticleInPayRecord($member,$articles[0]->GetId(),$orderId);
        $amt = $paymode['amt'];
    }
    else if($recordsCount>0){
        $orderId = $records[0]['id'];
        $ItemName = "有論文";
        $amt = $records[0]['amt'];
    }
    else{

        $response['code'] = 400;
        $response['value'] = 'nothing to pay';
        return $response;
    }
    //$orderId = $_POST['orderId'];
    
    $response['code'] = 200;
    $response['value'] = MPG::mpg_encrypt($member,$orderId,$ItemName,$amt);
    
    return $response;
}
function payNotify($sql){
    //接收api之街口
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $deTradeInfo = $data->TradeInfo;
    $info = MPG::mpg_decrypt($deTradeInfo);
    $jsoninfo = json_decode($info);
    $jsonResult = $jsoninfo->Result;
    $oid = $jsonResult->MerchantOrderNo;
    $amt = $jsonResult->Amt;
    $stat = $jsoninfo->Status=='SUCCESS'?1:0;
    $sql->UpdatePayment($oid,$amt,$stat);
}
function getPayRecord($sql){
    //顯示付款資訊
}
function GetPDFPayRecord($sql){
   //pdf
}

