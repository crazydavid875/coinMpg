<?php
class PayItem{
    public $id='';
    //public $paymodeid='';
   // public $recordid='';
    public $page=1;
    public $amt=0;
    public $total = 0;
    public $indent='';
    public $paymode='';
    public static $columns = ['page','rid'];

    public function __construct($data){
        if(isset($data['id'])){
            $this->id = $data['id'];
        }
        if(isset($data['page'])){
            $this->page = $data['page'];
        }
        if(isset($data['amt'])){
            $this->amt = $data['amt'];
        }
        if(isset($data['indent'])){
            $this->indent = $data['indent'];
        }
        if(isset($data['paymode'])){
            $this->paymode = $data['paymode'];
        }
        $this->total = $this->amt*$this->page;
    }
    public function getTotal(){
        $this->total = $this->amt*$this->page;
        return $this->total;
    }
}
