<?php
class Article{
    public $id='';
    public $title='';
    public $auth='';
    public $paperid='';
    public $pagecount='';
    public $hasPaid=false;
    public static $columns = ['title','auth', 'paperid','pagecount'];
    public function __construct($data){
        if(isset($data['id'])){
            $this->id = $data['id'];
        }
        if(isset($data['title'])){
            $this->title = $data['title'];
        }
        if(isset($data['auth'])){
            $this->auth = $data['auth'];
        }
        if(isset($data['paperid'])){
            $this->paperid = $data['paperid'];
        }
        if(isset($data['pagecount'])){
            $this->pagecount = $data['pagecount'];
        }
        if(isset($data['paytime'])&&$data['paytime']!=''){
            $this->hasPaid = true;
        }
    }
}