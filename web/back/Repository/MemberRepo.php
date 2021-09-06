<?php 
class MemberRepo{
    private $table = 'user';
    public function __construct(){

    }
    public function findAll(){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT * FROM $table WHERE 1");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $members = [];
            foreach($result as $member){
                array_push($members,new Member($member));
            }
            return $members;
        }
    }
    public function find($id){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT user.*,ind.name as indent FROM $table as user LEFT OUTER JOIN indentify as ind on 
        user.indentid=ind.id WHERE user.id=$id");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound("member");
        }
        else{
            $result = SQL::getResult();
            $member = new Member($result[0]);
            $member->pwd='*';
            return $member;
        }
    }
    public function findByRecord($rid){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT user.* FROM paymentrecord as record 
        join user on record.uid=user.id WHERE record.id='$rid'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound("member");
        }
        else{
            $result = SQL::getResult();
            $member = new Member($result[0]);
            $member->pwd='*';
            return $member;
        }
    }
    public function insert($member){
        $pwd = $member->pwd;    
        $name = $member->name;
        $email= $member->email;   
        $indent = $member->indent;              
        $position = $member->position;
        $affiliation  = $member->affiliation;          
        $country = $member->country;
        $tel = $member->tel;                   
        $ieeeid = $member->ieeeid;
        $studentid = $member->studentid;
        $isveg = $member->isveg;
        $teamsid = $member->teamsid;
        $table = $this->table;
        $query = "INSERT INTO $table
        (`pwd`,`name`, `email`, `indentid`, `position`, 
        `affiliation`, `country`, `tel`, `ieeeid`, `studentid`,isveg,teamsid) 
        VALUES ('$pwd','$name','$email',(select id from indentify where name='$indent')
        ,'$position','$affiliation','$country','$tel','$ieeeid','$studentid','$isveg','$teamsid')";
        
        $isSuccess = SQL::Insert($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            return SQL::getResult();
        }
    }
    public function update($id,$data){
        $table = $this->table;
        $set = '';
        $columns = Member::$columns;
        $member = new Member($data);
        foreach($data as $key=>$val){
            if(in_array($key,$columns))
                $set.= " $key='$val' ,";
        }
        if(isset($member->indent)){
            $indent = $member->indent;
            $set.= "indentid=(select id from indentify where name='$indent')";
        }
        $set = trim($set,',');
        $query = "UPDATE `user` SET $set WHERE id='$id'";
        
        $isSuccess = SQL::Update($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            return SQL::getResult();
        }
    }
    //public function delete($id){

    //}
    public function login($email,$pwd){
        $table = $this->table;
        $query = "SELECT * FROM $table WHERE email='$email' and pwd='$pwd'";
        $isSuccess = SQL::Select($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound("member");
        }
        else{
            $result = SQL::getResult();
            $member = new Member($result[0]);
            
            return $member;
        }
    }
}