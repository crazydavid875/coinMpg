<?php
//echo $_SERVER['REQUEST_URI'];
$perms = explode("/",$_SERVER['REQUEST_URI']);
$action = $perms[3];
$service = $perms[2];
global $sql;
session_start();
if($service=='account'){
    require_once('./api/member_opt.php');
    
    run($sql,$action);
}
else if($service=='payment'){
    require_once('./api/payment_opt.php');
    run($sql,$action);
}
else if($service=='article'){
    require_once('./api/article_opt.php');
    run($sql,$action,$perms[4]);
}

function GetUser(){
    global $sql;
    $member = null;
    
    if(isset($_SESSION['userID'])&&$_SESSION['userID']!=-1){
        $member = $sql->SelectUser($_SESSION['userID']);
        if($member==null){
            http_response_code(404);
            echo $sql->GetMsg();
            exit();
        }
    }
    else{
        http_response_code(400);
        echo 'please login';
        exit();
    } 
    return $member;
}