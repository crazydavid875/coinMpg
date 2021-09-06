<?php
class Member{
    public $id = '';
    public $email = '';
    //public $indentid ;
    public $affiliation = '';
    public $name = '';
    public $pwd = '';   
    public $position = '';  
    public $country = '';
    public $tel = '';                   
    public $ieeeid = '';
    public $isieee = false;
    public $studentid = '';
    public $isstudent =false;
    public $indent ;
    public $articles = [];
    public $paymentRecords = [];
    public $totalpaied=0;
    public $totalUnPay=0;
    public $isveg='';
    public $teamsid='';
    public $complete = false;
    public static $columns = ['pwd','name', 'email', 'position', 
    'affiliation', 'country', 'tel', 'ieeeid', 'studentid','isveg','teamsid'];
    public function __construct($data){
        if(isset($data['id'])){
            $this->id = $data['id'];
        }
        if(isset($data['teamsid'])){
            $this->teamsid = $data['teamsid'];
        }
        if(isset($data['isveg'])){
            $this->isveg = $data['isveg'];
        }
        if(isset($data['email'])){
            $this->email = $data['email'];
        }
        if(isset($data['name'])){
            $this->name = $data['name'];
        }
        if(isset($data['affiliation'])){
            $this->affiliation = $data['affiliation'];
        }
        
        if(isset($data['pwd'])){
            $this->pwd = $data['pwd'];
        }
        if(isset($data['position'])){
            $this->position = $data['position'];
        }
        if(isset($data['country'])){
            $this->country = $data['country'];
        }
        if(isset($data['tel'])){
            $this->tel = $data['tel'];
        }
        //if(isset($data['indentid'])){
        //    $this->indentid = $data['indentid'];
        //}
        
        if($data['indent']!='root'){
            if(isset($data['ieeeid'])&&$data['ieeeid']!=''){
                $this->ieeeid = $data['ieeeid'];
                $this->indent = 'ieee member';
                $this->isieee = true;
            }
            else{
                $this->indent = 'non ieee member';  
            }
            if(isset($data['studentid'])&&$data['studentid']!=''){
                $this->studentid = $data['studentid'];
                $this->indent = 'student';
                $this->isstudent = true;
            }
            
        }
        $this->complete =isset($data['teamsid'])&&$data['teamsid']!=''&&isset($data['isveg'])&&$data['isveg']!=''&& isset($data['name'])&&$data['name']!=''&&isset($data['affiliation'])&&$data['affiliation']!=''
        &&isset($data['position'])&&$data['position']!=''&&isset($data['country'])&&$data['country']!=''&&isset($data['tel'])&&$data['tel']!='';
    }
    public function getTotalpaied(){
        $this->totalpaied = 0;
        foreach($this->paymentRecords as $item){
            if($item->getIspay())
                $this->totalpaied +=$item->getTotal();
        }
        return $this->totalpaied;
    }
    public function getTotalUnPay(){
        $this->totalUnPay = 0;
        foreach($this->paymentRecords as $item){
            if(!$item->getIspay())
                $this->totalUnPay +=$item->getTotal();
        }
        return $this->totalUnPay;
    }
    public function hasComplete(){
        return $this->complete;
    }
    public function print(){
        $data = [];
        $data['email'] = $this->email;
        $data['name'] = $this->name;
        $data['affiliation'] = $this->affiliation;
        $data['indentify'] = $this->indentify;
        return $data;
    }
}