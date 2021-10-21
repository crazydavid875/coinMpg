<?php
class SQL{
    private static $mysql;
    private static $msg;
    private static $result;
    public static function Init(){
        $conn_IP = "db";
        $conn_userName = "root";
        $conn_passwd = "12345";
        $conn_db = "payment";
        SQL::$mysql = new mysqli($conn_IP,$conn_userName,$conn_passwd,$conn_db);
        
        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            echo mysqli_connect_error();
            exit();
        }
        
    }
    public static function Select($query){
        $mysql = SQL::$mysql;
        //echo $query.'\r\n\n';
        $result = $mysql->query($query);
        if(!$result){
            SQL::$msg = $mysql->error;
            return -1;
        }
        else{
            $index = 0;
            $datas = [];
            while($row = $result->fetch_assoc()){
                array_push($datas,$row);
                $index++;
            }
            SQL::$result = $datas;
            if($index == 0) return 0;
            else return 1;
        }
    }
    public static function Insert($query){
        $mysql = SQL::$mysql;
        $result = $mysql->query($query);
        if(!$result){
            SQL::$msg = $mysql->error;
            return -1;
        }
        elseif($mysql->affected_rows==0){
            return 0;
        }
        else{
            SQL::$result = $mysql->insert_id;
            return 1;
        }
    }
    public static function Update($query){
        $mysql = SQL::$mysql;
        $result = $mysql->query($query);
        if(!$result){
            SQL::$msg = $mysql->error;
            return -1;
        }
        elseif($mysql->affected_rows==0){
            return 0;
        }
        else{
            SQL::$result = $mysql->affected_rows;
            return 1;
        }
    }
    public static function Delete($query){
        $mysql = SQL::$mysql;
        $query;
        $result = $mysql->query($query);
        if(!$result){
            SQL::$msg = $mysql->error;
            return -1;
        }
        elseif($mysql->affected_rows==0){
            return 0;
        }
        else{
            SQL::$result = $mysql->affected_rows;
            return 1;
        }
    }
    public static function getMsg(){
        return SQL::$msg;
    }
    public static function getResult(){
        return SQL::$result;
    }
    
}