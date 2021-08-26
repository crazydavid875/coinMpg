<?php

$table = "field";

if($_SERVER['REQUEST_METHOD'] === 'GET'){//GET(SELECT),POST(INSERT),DELETE(DELETE),PATCH(UPDATE)
    $result = Select();
    
    http_response_code($result['code']);
    echo json_encode($result['value']);
    
}
else if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $data = (array)json_decode(trim(file_get_contents('php://input'),"[]")) ;
    $result = Insert($data);
    http_response_code($result['code']);
    echo json_encode($result['value']);
    
}
else if($_SERVER['REQUEST_METHOD'] === 'PATCH'){
    $_PATCH =  (array)json_decode(trim(file_get_contents('php://input'),"[]")) ;
    $id = $route->getParameter(2);
    $result = Update($_PATCH,$id);

    
    http_response_code($result['code']);
    echo json_encode($result['value']);
}
else if($_SERVER['REQUEST_METHOD'] === 'DELETE'){
    if($route->getParameter(2)!=''){
        $where = "id = ".$route->getParameter(2);
        $result = Delete($where);
        
        http_response_code($result['code']);
        echo json_encode($result['value']);
    }
    else{
        http_response_code(400);
        echo "please input id";
        
    }
    
}
function Select(){
    global $sql;
    global $table;
    global $arg1;
    $id = $arg1;
    $response['code'] = 200;
    $response['value'] = [];
    $index = 0;
    
    $query = "select * from $table where ".($id == ''? "1;":"id = $id;");
    $result = $sql->query($query);
    
    if(!$result) {
        $response['value'] = $sql->error;
        $response['code']=400;
        return $response;
    }
    while($row = $result->fetch_assoc()){
        $response['value'][$index] = $row;
        $index++;
    }
    if($index == 0){
        $response['code']=404;
        $response['value'] = "field not found";
    }
    
    return $response;
}

function Insert($data){
    global $sql;
    global $table;
    $response['code'] = 200;
    $response['value'] = '';
    
    return $response;
}

function Update($data,$id){
    global $sql;
    global $table;
    $response['code'] = 200;
    $response['value'] = '';
    
    return $response;
}

function Delete($where){
    global $sql;
    global $table;
    $response['code'] = 200;
    $response['value'] = '';
    
    return $response;
}
