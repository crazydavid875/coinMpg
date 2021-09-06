<?php 
class Member{
    
    private $id=-1;
    private $name;
    private $pwd;
    private $email;
    private $isVerify;
    private $articles = [];
    private $permit ;
    public function __construct($id,$name,$pwd,$email,$isVerify,$permit=0){
        $this->id = $id;
        $this->name = $name;
        $this->pwd = $pwd;
        $this->email = $email;
        $this->isVerify = $isVerify;
        $this->permi = $permit;
    }
    public function getPermit(){
        return $this->permit;
    }
    public function getId(){
        return $this->id;
    }
    public function addArticle($article){
        array_push($this->articles,$article);
        
    }
    public function getName(){
        return $this->name;
    }
    public function getEmail(){
        return $this->email;
    }
    public function getArticles(){
        return $this->articles;
    }
    public function getArticlesParse(){
        $output = [];
        $articles = $this->articles;
        foreach($articles as $item ){
            
            array_push($output,$item->Output());
        }
        return json_encode($output);
        
    }

}