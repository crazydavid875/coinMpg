<?php
final class SQL{
    private $mysql;
    private $msg;
    private $result;
    public function __construct(){
        $conn_IP = "db";
        $conn_userName = "root";
        $conn_passwd = "12345";
        $conn_db = "payment";
        $this->mysql = new mysqli($conn_IP,$conn_userName,$conn_passwd,$conn_db);
        
        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            echo mysqli_connect_error();
            exit();
        }
        
    }
    public function GetMsg(){
        return $this->msg;
    }
    public function GetResult(){
        return $this->result;
    }
    //user
    public function regist($name,$pwd,$email,$isVerify){
        $mysql = $this->mysql;
        $table ='user';
        $queryStr = "INSERT INTO $table(`pwd`, `name`, `email`, `isVerify`) 
        VALUES ('$pwd','$name','$email','$isVerify')";
        $member =null;
        
        $result = $mysql->query($queryStr);
        $insertid = $mysql->insert_id;
        if(!$result){
            $this->msg = $mysql->error;
        }
        elseif($mysql->affected_rows==0){
            $this->msg = 'not thing change';
        }
        else{
            $member = new Member($mysql->insert_id,$name,$pwd,$email,$isVerify);
            $this->msg = 'success';
            
        }
        return $member;
    }
    public function login($email,$pwd){
        $mysql = $this->mysql;
        
        $table ='user';
        $_email = $mysql->real_escape_string($email);
        $_pwd = $mysql->real_escape_string($pwd);
        $queryStr = "SELECT * FROM $table WHERE email='$_email' AND pwd='$_pwd'";
        $member = null;
        
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        else{
            while($row = $result->fetch_assoc()){
                $data = $row;
                $index++;
            }
            if($index == 0){
                $this->msg  = "account not found";
            }
            else{
                
                $member = new Member($data['id'],$data['name'],$data['pwd'],$data['email'],$data['isVerify']);
                $this->msg = 'success';
            }
        }
        return $member;
    }
    public function SelectUser($id){
        $mysql = $this->mysql;
        
        $table ='user';
        
        $queryStr = "SELECT * FROM $table WHERE id = '$id' ";
        $member = null;
        
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        else{
            while($row = $result->fetch_assoc()){
                $data = $row;
                $index++;
            }
            if($index == 0){
                $this->msg  = "account not found";
            }
            else{
                //print_r($data)
                $member = new Member($data['id'],$data['name'],$data['pwd'],$data['email'],$data['isVerify']);
                $this->msg = 'success';
            }
        }
        return $member;
    }
    //article
    public function SelectArticles($member){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='article';
        $uid = $member->getId();
        $queryStr = "SELECT * FROM $table WHERE uid = '$uid' ";
        
        
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
            return null;
        }
        else{
            $index = 0;
            while($row = $result->fetch_assoc()){
                $article = new Article($row['id'],$row['title'],$row['auth']);
                $member->addArticle($article);
                $index++;
            }
            
            $this->msg = $index;
        }
        return $member;
    }
    public function InsertArticle($member,$title,$auth){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='article';
        $uid = $member->getId();
        $queryStr = "INSERT INTO $table (`title`, `auth`, `uid`) 
        VALUES ('$title','$auth','$uid') ";
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        elseif($mysql->affected_rows==0){
            $this->msg = 'not thing change';
        }
        else{
            $article = new Article($mysql->insert_id,$title,$auth);
            $member->addArticle($article);
            $this->msg = 'success';
        }
        
        return $article;
    }
    public function UpdateArticle($member,$id,$title,$auth){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='article';
        
        $strarr = [];
        if(isset($title))array_push($strarr,"`title`='$title'");
        if(isset($auth))array_push($strarr,"`auth`='$auth'");
        $strarr = implode(',',$strarr);
        $uid = $member->getId();
        $queryStr = "UPDATE $table SET $strarr WHERE id='$id' AND uid='$uid' ";
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        elseif($mysql->affected_rows==0){
            $this->msg = 'not thing change';
        }
        else{
            $this->msg = 'success';
            return new Article($id,$title,$auth);
        }
        
        //return $article;
    
    }
    public function SetArticleInPayRecord($member,$id,$rid){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='article';

        $uid = $member->getId();
        $queryStr = "UPDATE $table SET rid='$rid' WHERE id='$id' AND uid='$uid' ";
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        elseif($mysql->affected_rows==0){
            $this->msg = 'not thing change';
        }
        else{
            $this->msg = 'success';
            return new Article($id,$title,$auth);
        }
    }
    public function DeleteArticle($member,$id){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='article';
        $uid = $member->getId();
        $queryStr = "DELETE FROM $table WHERE id='$id' AND uid='$uid' ";
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        elseif($mysql->affected_rows==0){
            $this->msg = 'not thing change';
        }
        else{
            $this->msg = 'success';
            return true;
        }
        return false;
        //return $article;
    
    }

    //pay record
    public function SelectPaymentRecords($member,$ispay = null){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymentrecord';
        $uid = $member->getId();
        
        $queryStr = "SELECT * FROM $table WHERE uid = '$uid' ";
        if($ispay!=null) $queryStr.=" and ispay='$ispay'";
        $records= [];
        
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
            return null;
        }
        else{
            $index=0;
            while($row = $result->fetch_assoc()){
                array_push($records,$row);
                $index++;
            }
            
            $this->msg = $index;
        }
        return $records;
    }
    public function InsertPayRecord($member,$paymode,$amt){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymentrecord';
        $uid = $member->getId();
        $insertid = -1;
        $currtime = time();
        $queryStr = "INSERT INTO $table (`timestamp`, pid,`uid`,amt) 
        VALUES ('$currtime','$paymode','$uid','$amt') ";
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        elseif($mysql->affected_rows==0){
            $this->msg = 'not thing change';
        }
        else{
            $insertid = $mysql->insert_id;
            $this->msg = 'success';
        }
        
        return $insertid;
        
    }
    public function UpdatePayment($id,$amt,$stat){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymentrecord';
        
        $queryStr = "UPDATE $table SET ispay='$state' WHERE id='$id' amt='$amt' ";
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
        }
        elseif($mysql->affected_rows==0){
            $this->msg = 'not thing change';
        }
        else{
            $this->msg = 'success';
        }
        return $this->msg;
    }
    //paymode
    public function SelectPayMode($name){
        
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymode';

        $queryStr = "SELECT * FROM $table WHERE name = '$name' ";
        $result = $mysql->query($queryStr);
        $mode = '';
        if(!$result){
            $this->msg = $mysql->error;
            return null;
        }
        else{
            while($row = $result->fetch_assoc()){
                $mode = $row;
            }
            //$this->msg = $index;
        }
        return $mode;
    }
}
$sql = new SQL();
