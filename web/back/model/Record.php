<?php
class Record{
    public $id='';
    public $createtime=0;
    public $paytime;
    public $des='';
    public $receiptitle='';
    public $items=[];
    public $total=0;
    public $createtimestr='';
    public static $columns = ['createtime', 'paytime', 'des','receiptitle'];

    public function __construct($data){
        if(isset($data['id'])){
            $this->id = $data['id'];
        }
        if(isset($data['createtime'])){
            $this->createtime =   $data['createtime'];
            $this->createtimestr = date("Y-m-d H:i:s",$data['createtime']);
        }
        if(isset($data['paytime'])){
            $this->paytime = $data['paytime'];
        }
        if(isset($data['des'])){
            $this->des = $data['des'];
        }
        if(isset($data['receiptitle'])){
            $this->receiptitle = $data['receiptitle'];
        }
        if(isset($data['items'])){
            $this->items = $data['items'];
        }
    }
    public function getTotal(){
        $this->total = 0;
        foreach($this->items as $item){
            $this->total +=$item->getTotal();
        }
        return $this->total;
    }
    public function getIspay(){
        return isset($this->paytime)&&$this->paytime!='';
    }
}
