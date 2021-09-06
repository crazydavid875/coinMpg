<?php

class RecordRepo{
    private $table = 'paymentrecord';
    public function __construct(){

    }
    public function findAll($uid){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT * FROM $table WHERE uid='$uid'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $records = [];
            foreach($result as $record){
                array_push($records,new Record($record));
            }
            return $records;
        }
    }
    public function find($id){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT * FROM $table WHERE id='$id'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound('record');
        }
        else{
            $result = SQL::getResult();
            
            return new Record($result[0]);
        }
    }
    
    public function insert($uid,$record){
            
        $createtime = $record->createtime; 
        $des = $record->des;              
        $receiptitle = $record->receiptitle;         
        $id =  $record->createtime;
        $table = $this->table;
        $query = "INSERT INTO $table
        ( `createtime`, `uid`, `des`, `receiptitle`) 
        VALUES ('$createtime','$uid','$des','$receiptitle')";
        
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
        $columns = Record::$columns;
        foreach($data as $key=>$val){
            if(in_array($key,$columns))
                $set.= " $key='$val' ,";
        }
        $set = trim($set,',');
        $query = "UPDATE $table SET $set WHERE id='$id'";
        
        $isSuccess = SQL::Update($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            return SQL::getResult();
        }
    }
    public function delete($id){
        $table = $this->table;
        
        $query = "DELETE FROM $table WHERE id='$id'";
        
        $isSuccess = SQL::Delete($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            return SQL::getResult();
        }
    }
}