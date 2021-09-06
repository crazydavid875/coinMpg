<?php

class PayItemRepo{
    private $table = 'paymentItem';
    public function __construct(){

    }
    public function findAll($recordid){
        $table = $this->table;
        $query = "SELECT item.*,paymode.name as paymode,paymode.amt as amt,
        ind.name as indent ,paymode.name as paymode
        FROM $table as item JOIN paymode on paymode.id=item.pid
        left JOIN indentify as ind on ind.id=paymode.indentid WHERE rid='$recordid'";
        $isSuccess = SQL::Select($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $payitems = [];
            foreach($result as $payitem){
                array_push($payitems,new PayItem($payitem));
            }
            return $payitems;
        }
    }
    public function find($id){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT item.*,paymode.name as paymode,paymode.amt as amt,
        ind.name as indent ,paymode.name as paymode
        FROM $table as item JOIN paymode on paymode.id=item.pid
        left JOIN indentify as ind on ind.id=paymode.indentid WHERE id='$id'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound('payitem');
        }
        else{
            $result = SQL::getResult();
            
            return new PayItem($result[0]);
        }
    }
    
    public function insert($recordid,$payitem,$aid='NULL'){
        $paymode = $payitem->paymode;
        $page = $payitem->page;      
        $table = $this->table;
        $indent = $payitem->indent;
        $indentstr= '';
        if(isset($indent)&&$indent!=''){
            $indentstr= "and indentid=
            (select id from indentify where name='$indent')";
        }
        
        $query = "INSERT INTO $table
        (`pid`, `rid`, `page`,aid) 
        VALUES (
            (select id from paymode where name='$paymode' $indentstr ),'$recordid','$page',$aid)";
        
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
        $columns = PayItem::$columns;
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
    public function updatePids($rid,$hasArticle,$indent){
        $table = $this->table;
        $set = '';
        if($hasArticle)$hasArticleName = 'has article';
        else $hasArticleName = 'without article';
        echo $query = "UPDATE $table SET pid=(
            select id from paymode where name='$hasArticleName' 
            and indentid=(select id from indentify where name='$indent')) WHERE rid='$rid' and 
            pid<>(select id from paymode where name='extra page')";
        
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