<?php

$table = "user_account";

switch($_SERVER['REQUEST_METHOD']) {
case 'GET':
    $data =  (array)json_decode(trim(file_get_contents('php://input'),"[]"));
    $id = $route->getParameter(2);
    $result = Select($id, $data);

    http_response_code($result['code']);
    echo json_encode($result['value']);
    break;
case 'POST':
    $data = (array)json_decode(trim(file_get_contents('php://input'),"[]"));
    $result = Insert($data);

    http_response_code($result['code']);
    echo json_encode($result['value']);
    break;
case 'PATCH':
    $data =  (array)json_decode(trim(file_get_contents('php://input'),"[]"));
    $id = $route->getParameter(2);
    $result = Update($id, $data);
    
    http_response_code($result['code']);
    echo json_encode($result['value']);
    break;
case 'DELETE':
    if($route->getParameter(2) != ''){
        $result = Delete($route->getParameter(2));
        
        http_response_code($result['code']);
        echo json_encode($result['value']);
    }
    else{
        http_response_code(400);
        echo "please input id";
    }
    break;
default:
    http_response_code(400);
    echo "invalid request";
}

function Select($id, $data){
    global $sql;
    global $table;
    $response = array();

    if($id == ''){  //query by name and passwd
        $name = $data['name'];
        $passwd = $data['passwd'];
        $query = "select * from $table where name = $name;";
        $result = $sql->query($query);

        if($result->num_rows == 0) {
            $response['code'] = 404;
            $response['value'] = "user not found";
        }
        else {
            $row = $result->fetch_assoc();
            if(Validate($passwd, $row['passwd'])) {
                $response['code'] = 200;
                $response['value'][] = $row;
            }
            else {
                $response['code'] = 404;
                $response['value'] = 'user not found';
            }
        }
    }
    else {          //query by user id
        $query = "select * from $table where id = $id;";
        $result = $sql->query($query);

        if($result->num_rows == 0) {
            $response['code'] = 404;
            $response['value'] = "user not found";
        }
        else {
            $response['code'] = 200;
            while($row = $result->fetch_assoc())
                $response['value'][] = $row;
        }
    }
    
    return $response;
}

function Insert($data){
    global $sql;
    global $table;
    $response = array();

    $values = sprintf("'%s'", implode("','", Encrypt($data)));
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

function Update($id, $data){
    global $sql;
    global $table;
    $response = array();

    $set = "";
    foreach(Encrypt($data) as $key => $value)
        $set .= ", $key = '$value'";
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
            $response['value'] = "user not found";
        }
        else {
            $response['code'] = 200;
            $response['value'] = "update successfully";
        }
    }
    
    return $response;
}

function Delete($id){
    global $sql;
    global $table;
    $response = array();

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

function Encrypt($data) {
    if(array_key_exists('passwd', $data)) {
        $passwd = $data['passwd'];
        $salt = base64_encode(random_bytes(32));

        $hashed = crypt($passwd, '$6$'.$salt);
        $data['passwd'] = $hashed;
    }

    return $data;
}

function Validate($passwd, $hashed) {
    if(crypt($passwd, $hashed) == $hashed)
        return true;
    else
        return false;
}