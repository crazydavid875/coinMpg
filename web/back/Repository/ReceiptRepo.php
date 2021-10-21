<?php
class ReceiptRepo{
    private $table = 'receipt';
    public function __construct(){

    }
    public function findReceiptTitle($id){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT * FROM paymentitem as item 
        join paymentrecord as record on record.id = item.rid  WHERE item.receiptid='$id'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound('record');
        }
        else{
            $result = SQL::getResult();
            
            return $result[0]['receiptitle'];
        }
    }
    public function findAll($uid){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT * FROM $table WHERE uid='$uid'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $receipts = [];
            foreach($result as $receipt){
                array_push($receipts,new Receipt($receipt));
            }
            return $receipts;
        }
    }
    public function find($id){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT * FROM $table WHERE id='$id'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound('receipt');
        }
        else{
            $result = SQL::getResult();
            
            return new Receipt($result[0]);
        }
    }
    
    public function insert($uid,$receipt){
            
        $datetime = $receipt->datetime; 
        $articleTitle = $receipt->articleTitle; 
        $total = $receipt->total; 
        $table = $this->table;
        $query = "INSERT INTO $table
        ( `uid`,`datetime`,`articleTitle`,total) 
        VALUES ('$uid','$datetime','$articleTitle','$total')";
        
        $isSuccess = SQL::Insert($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            return SQL::getResult();
        }
    }
    public function updateDist($id,$dist){
        $table = $this->table;
        
        $query = "UPDATE $table SET dist='$dist' WHERE id='$id'";
        
        $isSuccess = SQL::Update($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            return SQL::getResult();
        }
    }
}