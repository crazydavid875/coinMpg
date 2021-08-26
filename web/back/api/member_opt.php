<?php 
//todo email驗證流程
function run($sql,$action){
    $_SESSION['userID'] = isset($_SESSION['userID'])?$_SESSION['userID']:-1;
    $_SESSION['verifyCode'] = isset($_SESSION['verifyCode'])?$_SESSION['verifyCode']:null;
    if($_SERVER['REQUEST_METHOD']=='POST'){
        switch ($action) {
            case 'regist':
                $response = regist($sql);
                break;
            case 'login':
                $response = login($sql);
                break;
            case 'logout':
                $response = logout();
                break;
            case 'SendVerifyCode':
                $response = SendVerifyCode($sql);
                break;
            default:
                $response['code'] = 404;
                $response['value'] = 'action not found';
                break;
        }
    }
    else if($_SERVER['REQUEST_METHOD']=='GET'){
        switch ($action) {
            case 'info':
                $response = getInfo($sql);
                break;
            case 'emailVerify':
                $response = verifyEmail($sql);
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
function regist($sql){
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $pwd = $data->pwd;
    $name = $data->name;
    $email = $data->email;
    $isVerify = -1;
    $response = array('code'=>'','value'=>'');
    $result = $sql->regist($name,$pwd,$email,$isVerify);
    if(!$result){
        $response['code'] = 400;
        $response['value'] = $sql->GetMsg();
    }
    else{
        $_SESSION['userID'] = $result->getId();
        $response['code'] = 200;
        $response['value'] = $result->getId();
    }

    return $response;
}
function login($sql){
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    
    $pwd = $data->pwd;
    $email = $data->email;
    $response = array('code'=>'','value'=>'');
    $result = $sql->login($email,$pwd);
    if(!$result){
        $response['code'] = 400;
        $response['value'] = $sql->GetMsg();
    }
    else{
        $response['code'] = 200;
        $response['value'] = "success";
        $_SESSION['userID'] = $result->getId();
    }
    
    return $response;
}
function logout(){
    unset($_SESSION['userID']) ;
}
function verifyEmail($sql){
    //email驗證
}
function SendVerifyCode($sql){
    $member = GetUser();
    $code = getHash();
    echo $_SESSION['verifyCode'] = $code;
    return $response;
    //產生email驗證碼，並記出信箱  todo:寄信
}
//change name pwd email
function getHash(){
    return rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
}
function getInfo($sql){
    $member = GetUser();
    $member->getName();
    $state = ['未繳款','尚未繳清','已繳清'];
    $ispayStr = '';
    $member = $sql->SelectArticles($member);
    $articles = $member->getArticles();
    $articleCount = $sql->GetMsg();
    $records = $sql->SelectPaymentRecords($member,-1);
    $ispayNotrecordsCount = $sql->GetMsg();
    $records = $sql->SelectPaymentRecords($member,1);
    $ispayrecordsCount = $sql->GetMsg();
    if($ispayNotrecordsCount==0&&$ispayrecordsCount==0) {
        $ispayStr = $state[0];
    }
    else if($ispayNotrecordsCount>0){
        $ispayStr = $ispayNotrecordsCount."筆".$state[1];
    }
    else{
        $ispayStr = $state[2];
    }
    $response['value'] = json_encode( array(
    "name"=>$member->getName(),
    "email"=>$member->getEmail(),
    "ispay"=>$ispayStr
    ));
    $response['code'] = 200;
    return $response;
}