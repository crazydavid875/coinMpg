<?php
class Article{
    private $id;
    private $title;
    private $auth;
    public function __construct($id,$title,$auth){
        $this->id = $id;
        $this->title = $title;
        $this->auth = $auth;
    }
    public function GetId(){
        return $this->id;
    }
    public function Output(){
        return array('id' =>$this->id ,'title'=>$this->title,'auth'=>$this->auth );
    }
    public function setTitle($title){
        $this->title = $title;
    }
    public function setAuth($auth){
        $this->auth = $auth;
    }
}