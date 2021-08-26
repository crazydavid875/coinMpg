<?php
    $testMode = FALSE;
    $authmemberid  = -1;
    $isManager = false;
    $route = new Router(Request::uri()); //搭配 .htaccess 排除資料夾名稱後解析 URL
    $route->getParameter(1); // 從 http://127.0.0.1/game/aaa/bbb 取得 aaa 字串之意
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true");

    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
    header("Access-Control-Allow-Methods: PUT, POST,PATCH , GET, OPTIONS, DELETE");
    // 用參數決定載入某頁並讀取需要的資料
    //$isauth = CheckAuth();
    $action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
    $arg1 = filter_input(INPUT_GET, 'arg1', FILTER_SANITIZE_STRING);
    $arg2 = filter_input(INPUT_GET, 'arg2', FILTER_SANITIZE_STRING);
    switch($action){
    case "course":
         include('apis/course.php');
        break;
    case "reference":
        include('apis/reference.php');
         break;
    case "department":
        include('apis/department.php');
        break;
    case "field":
        include('apis/field.php');
        break;
    case "mappingFDC":
        include('apis/mappingFDC.php');
        break;
    case "mappingCR":
        include('apis/mappingCR.php');
        break;
    case "user":
        include('apis/user.php');
        break;
    }
?>
