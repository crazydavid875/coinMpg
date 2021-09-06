<?php
function articlerun($sql,$action,$id){
    if($_SERVER['REQUEST_METHOD']=='POST'){
        switch ($action) {
            case '':
                $response = addArticle($sql);
                break;
            case 'multi':
                $response = addMultiArticles($sql);
                break;
            default:
                $response['code'] = 404;
                $response['value'] = 'action not found';
                break;
        }
    }
    else if($_SERVER['REQUEST_METHOD']=='GET'){
        switch ($action) {
            case '':
                $response = getArticles($sql);
                break;
            default:
                $response['code'] = 404;
                $response['value'] = 'action not found';
                break;
        }
    }
    else if($_SERVER['REQUEST_METHOD']=='PATCH'){
        switch ($action) {
            case 'aid':
                $response = SetArticle($sql,$id);
                break;
            default:
                $response['code'] = 404;
                $response['value'] = 'action not found';
                break;
        }
    }
    else if($_SERVER['REQUEST_METHOD']=='DELETE'){
        switch ($action) {
            case 'aid':
                $response = DeleteArticle($sql,$id);
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
//新增論文
function addArticle($sql){
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $title = $data->title;
    $auth = $data->auth;
    
    $response = array('code'=>'','value'=>'');

    $member = GetUser();
    $result = $sql->InsertArticle($member,$title,$auth);
    if(!$result){
        $response['code'] = 400;
        $response['value'] = $sql->GetMsg();
    }
    else{
        $response['code'] = 200;
        $response['value'] = $result->getId();
    }

    return $response;
    
}
function addMultiArticles($sql){
    $json = file_get_contents('php://input');
    $data = json_decode($json)->datas;
    
    
    $response = array('code'=>'','value'=>'');

    $member = GetUser();
    $result = $sql->InsertMultiArticle($member,$data);
    if(!$result){
        $response['code'] = 400;
        $response['value'] = $sql->GetMsg();
    }
    else{
        $response['code'] = 200;
        $response['value'] = $result->getId();
    }

    return $response;
}
//取得使用者論文
function getArticles($sql){
    
    
    $response = array('code'=>'','value'=>'');

    $member = GetUser();
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
//修改論文
function SetArticle($sql,$id){
    parse_str(file_get_contents('php://input'), $data);
    $title = isset($data['title'])?$data['title']:null;
    $auth = isset($data['auth'])?$data['auth']:null;
    
    $response = array('code'=>'','value'=>'');

    $member = GetUser();
    $result = $sql->UpdateArticle($member,$id,$title,$auth);
    if(!$result){
        $response['code'] = 400;
        $response['value'] = $sql->GetMsg();
    }
    else{
        $response['code'] = 200;
        $response['value'] = $result->getId();
    }

    return $response;
}
//刪除論文
function DeleteArticle($sql,$id){

    $response = array('code'=>'','value'=>'');

    $member = GetUser();
    $result = $sql->DeleteArticle($member,$id);
    if(!$result){
        $response['code'] = 400;
        $response['value'] = $sql->GetMsg();
    }
    else{
        $response['code'] = 200;
        $response['value'] =  $sql->GetMsg();
    }
    return $response;
}