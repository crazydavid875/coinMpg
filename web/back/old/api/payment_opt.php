<?php
function payrun($sql,$action){
    //$_SESSION['userID'] = isset($_SESSION['userID'])?$_SESSION['userID']:-1;
    if($_SERVER['REQUEST_METHOD']=='POST'){
        switch ($action) {
            case 'refreashRecord':
                $response = refreashRecord($sql);
                break;
            case 'addPayRecord':
                $response = addPayRecord($sql);
                break;
            case 'getMPGRecord':
                $response = getMPGRecord($sql);
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
function getMPGRecord($sql){
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $paytype = $data->paytype;
    $member = GetUser();
    $records = $sql->SelectPaymentRecords($member);
    $recordsCount = $sql->GetMsg();
    $ItemName = '';
    if($recordsCount>0){
        $orderId = $records[0]['id'];
        $ItemName = $records[0]['content'];
        $amt = $records[0]['amt'];
        
    }
    else{

        $response['code'] = 400;
        $response['value'] = 'nothing to pay';
        return $response;
    }
    //$orderId = $_POST['orderId'];
    
    $response['code'] = 200;
    $response['value'] = MPG::mpg_encrypt($member,$orderId,$ItemName,$amt,$paytype);
    
    return $response;
}
function addPayRecord($sql){
    $member = GetUser();
    $articleCount = $sql->SelectArticleCount($member);
    $hasPayarticleCount = $sql->SelectHasPayArticleCount($member);
    $ItemName = '';
    if($hasPayarticleCount<=0 && $articleCount<=0 ){
        $ItemName = "沒有論文";
        $paymode = $sql->SelectPayMode($ItemName);
        $orderId = $sql->InsertPayRecord($member,$paymode['id'],$paymode['amt'],$ItemName,0);
        if($orderId==-1){
            $response['code'] = 400;
            $response['value'] = $sql->GetMsg();
            return $response;
        }
        $amt = $paymode['amt'];
    }
    else if($articleCount - $hasPayarticleCount>0){
        $topaycount = ($articleCount - $hasPayarticleCount);
        $ItemName = $topaycount."篇論文";
        $paymode = $sql->SelectPayMode("有論文");
        $totalpay = $paymode['amt']*$topaycount;
        $orderId = $sql->InsertPayRecord($member,$paymode['id'], $totalpay,$ItemName,$topaycount);
        if($orderId==-1){
            $response['code'] = 400;
            $response['value'] = $sql->GetMsg();
            return $response;
        }
        //$sql->SetArticleInPayRecord($member,$articles[0]->GetId(),$orderId);
        $amt = $totalpay;
    }
    else{
        $response['code'] = 400;
        $response['value'] = 'nothing to pay';
        return $response;
    }
    $response['code'] = 200;
    $response['value'] = 'success';
    return $response;
}
function refreashRecord($sql){
    $member = GetUser();
    $sql->DeleteUnPay($member);
    return addPayRecord($sql);
    
}
function payNotify($sql){
    //接收api之街口

    $data = $_POST;
    $deTradeInfo = $data['TradeInfo'];

    $jsoninfo = json_decode(MPG::mpg_decrypt($deTradeInfo));
    
    
    $jsonResult = $jsoninfo->Result;
    $oid = $jsonResult->MerchantOrderNo;
    $amt = $jsonResult->Amt;
    $stat = $jsoninfo->Status=='SUCCESS'?1:0;
    
    $msg = $sql->UpdatePayment($oid,$amt,$stat);
    if($msg=='success')$response['code'] = 200;
    else $response['code'] = 400;
    $response['value'] =$msg;
    return $response;
}
function getPayRecord($sql){
    //顯示付款資訊
    $member = GetUser();
    $records = $sql->SelectPaymentRecords($member);
    $recordsCount = $sql->GetMsg();
    $response['value'] = json_encode($records);
    $response['code'] = 200;
    return $response;
}
function GetPDFPayRecord($sql){
   //pdf
}

