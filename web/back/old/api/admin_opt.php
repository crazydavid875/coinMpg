<?php
function adminrun($sql,$action,$memberid){
    //$_SESSION['userID'] = isset($_SESSION['userID'])?$_SESSION['userID']:-1;
    $member = GetUser();
    if($member->getPermit()!=1) {
        http_response_code('500');
        echo 'permission deline';
        return;
    }
    if($_SERVER['REQUEST_METHOD']=='GET'){
        switch ($action) {
            case 'accounts':
                $response = getAccounts($sql);
                break;
            case 'article':
                $response = getArticle($sql,$memberid);
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
function getAccounts($sql){
    $member = GetUser();

    $records = $sql->SelectAllUser();
    if($sql->GetMsg()=='success')
        $response['code'] = 200;
    else
        $response['code'] = 400;
    $response['value'] = $records;
    return $response;
}
function getArticle($sql,$memberid){
    $member = $sql->SelectUser($memberid);
    if($sql->GetMsg()!='success') {
        $response['code'] = 404;
        $response['value'] = $sql->GetMsg();
        return $response;
    }
    $response = array('code'=>'','value'=>'');


    $member = $sql->SelectArticles($member);
    if(!$member){
        $response['code'] = 400;
        $response['value'] = $sql->GetMsg();
    }
    else{
        $response['code'] = 200;
        $response['value'] = $member->getArticlesParse();
    }

    return $response;
    
}