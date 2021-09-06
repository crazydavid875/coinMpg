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
        $queryStr = "INSERT INTO $table(`pwd`, `name`, `email`, `isVerify`,permit) 
        VALUES ('$pwd','$name','$email','$isVerify','0')";
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
                $member = new Member($data['id'],$data['name'],$data['pwd'],$data['email'],$data['isVerify'],$data['premit']);
                $this->msg = 'success';
            }
        }
        return $member;
    }
    public function SelectAllUser(){
        $mysql = $this->mysql;
        $this->msg = 'success';
        $table ='user';
        
        $queryStr = "SELECT user.id,user.name,user.email,user.isVerify,record.ac 
        as payarticleCount,record.amt as haspay,article.c as aricleCount  
        FROM `user`  left OUTER JOIN 
        (SELECT SUM(articleCount) as ac,SUM(amt) as amt,uid FROM paymentrecord WHERE paymentrecord.ispay=1 GROUP BY uid ) 
        as record on record.uid = user.id 
        LEFT JOIN (SELECT COUNT(id) as c,uid FROM article GROUP BY uid) 
        as article on article.uid=user.id  WHERE permit<>1; ";
        
        
        $result = $mysql->query($queryStr);
        
        if(!$result){
            return $this->msg = $mysql->error;
        }
        else{
            $data = [];
            while($row = $result->fetch_assoc()){
                array_push($data,$row);
                $index++;
            }
            if($index == 0){
                return $this->msg  = "account not found";
            }
            
            return json_encode($data);
        }
        
    }
    public function UpdateUser($member,$name,$email){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='user';
        
        $strarr = [];
        if(isset($name))array_push($strarr,"`name`='$name'");
        if(isset($email))array_push($strarr,"`email`='$email'");
        $strarr = implode(',',$strarr);
        $uid = $member->getId();
        $queryStr = "UPDATE $table SET $strarr WHERE id='$uid' ";
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
    public function SelectArticleCount($member){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='article';
        $uid = $member->getId();
        $queryStr = "SELECT COUNT(*) as count FROM  $table WHERE uid = '$uid' ";
        
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
            return null;
        }
        else{
            $index = 0;
            $row = $result->fetch_assoc();
            $this->msg = $row['count'];
            
        }
        return $this->msg;
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
    public function InsertMultiArticle($member,$data){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='article';
        $uid = $member->getId();
        foreach($data as $item){
            $datastr .=" ('$item->title','$item->auth','$uid'),";
        }
        $datastr = trim($datastr,',');
        $queryStr = "INSERT INTO $table (title,auth,uid)    
        VALUES $datastr ";
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
    public function SelectHasPayArticleCount($member){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymentrecord';
        $uid = $member->getId();
        $queryStr = "SELECT SUM(articleCount) as haspay FROM $table  WHERE uid = '$uid' ";
        
        $result = $mysql->query($queryStr);
        
        if(!$result){
            $this->msg = $mysql->error;
            return null;
        }
        else{
            $index = 0;
            $row = $result->fetch_assoc();
            $this->msg = $row['haspay'];
            
        }
        return $this->msg;
    }
    public function SelectPaymentRecords($member,$ispay = null){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymentrecord';
        $uid = $member->getId();
        
        $queryStr = "SELECT *,CASE WHEN ispay = 1 THEN '已繳費' ELSE '未繳費' END as status FROM paymentrecord WHERE uid = '$uid' ";
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
                $row['time'] =date('Y-m-d H:i:s',$row['timestamp']);
                array_push($records,$row);
                $index++;
            }
            
            $this->msg = $index;
        }
        return $records;
    }
    public function InsertPayRecord($member,$paymode,$amt,$content,$count){
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymentrecord';
        $uid = $member->getId();
        $insertid = -1;
        $currtime = time();
        $queryStr = "INSERT INTO $table (`timestamp`, pid,`uid`,amt,content,articleCount) 
        VALUES ('$currtime','$paymode','$uid','$amt','$content','$count') ";
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
        
        $queryStr = "UPDATE $table SET ispay='$stat' WHERE id='$id' and amt='$amt' ";
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
    public function DeleteUnPay($member)
    {
        $mysql = $this->mysql;
        $this->msg ='';
        $table ='paymentrecord';
        $uid = $member->getId();
        $queryStr = "DELETE FROM `paymentrecord`  WHERE uid='$uid' and ispay='-1' ";
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
