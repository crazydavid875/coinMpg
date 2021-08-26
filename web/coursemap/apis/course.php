<?php

$table = "course";

if($_SERVER['REQUEST_METHOD'] === 'GET'){//GET(SELECT),POST(INSERT),DELETE(DELETE),PATCH(UPDATE)
    $result = Select();
    
    http_response_code($result['code']);
    echo json_encode($result['value']);
}
else if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $data = (array)json_decode(trim(file_get_contents('php://input'),"[]"));
    $result = Insert($data);

    http_response_code($result['code']);
    echo json_encode($result['value']);
}
else if($_SERVER['REQUEST_METHOD'] === 'PATCH'){
    $data =  (array)json_decode(trim(file_get_contents('php://input'),"[]"));
    $result = Update($data);
    
    http_response_code($result['code']);
    echo json_encode($result['value']);
}
else if($_SERVER['REQUEST_METHOD'] === 'DELETE'){
    global $arg1;
    if($arg1 != ''){
        $result = Delete();
        
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
    global $arg1, $arg2;
    $response['code'] = 200;
    $response['value'] = [];
    $index = 0;

    $query = '';
    if($arg2 == '') //query by course id
        $query = "select * from $table where ".($arg1 == ''? "1;":"id = $arg1;");
    else            //query by department id and field id
        $query = "select id, cid from mapping_field_department_course where fid = $arg1 and did = $arg2;";
    $result = $sql->query($query);
    
    if(!$result) {
        $response['code']=400;
        $response['value'] = $sql->error;
        return $response;
    }
    while($row = $result->fetch_assoc()){
        $response['value'][$index] = $row;
        $index++;
    }
    if($index == 0){
        $response['code']=404;
        $response['value'] = "course not found";
    }
    
    return $response;
}

function Insert($data){
    global $sql;
    global $table;
    $response['code'] = null;
    $response['value'] = '';

    $values = sprintf("'%s'", implode("','", $data));
    $query = "insert into $table values(default, $values);";
    $result = $sql->query($query);

    if(!$result) {
        $response['code'] = 400;
        $response['value'] = $sql->error;
    }
    else {
        $response['code'] = 201;
        $response['value'] = $sql->insert_id;
    }

    return $response;
}

function Update($data){
    global $sql;
    global $table;
    global $arg1;
    $id = $arg1;
    $response['code'] = null;
    $response['value'] = '';

    $set = "";
    foreach($data as $key => $value)
        $set .= ",$key = '$value'";
    $set = trim($set, ",");
    $query = "update $table set $set where id = $id;";
    $result = $sql->query($query);

    if(!$result) {
        $response['code'] = 400;
        $response['value'] = $sql->error;
    }
    else {
        if($sql->affected_rows == 0) {
            $response['code'] = 404;
            $response['value'] = "course not found";
        }
        else {
            $response['code'] = 200;
            $response['value'] = "update successfully";
        }
    }
    
    return $response;
}

function Delete(){
    global $sql;
    global $table;
    global $arg1;
    $id = $arg1;
    $response['code'] = 200;
    $response['value'] = '';
    
    $query = "delete from $table where id = $id;";
    $result = $sql->query($query);

    if(!$result) {
        $response['code'] = 400;
        $response['value'] = $sql->error;
    }
    else {
        if($sql->affected_rows == 0) {
            $response['code'] = 404;
            $response['value'] = "course not found";
        }
        else {
            $response['code'] = 200;
            $response['value'] = "delete successfully";
        }
    }

    return $response;
}
