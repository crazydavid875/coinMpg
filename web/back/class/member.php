<?php 
class Member{
    
    private $id=-1;
    private $name;
    private $pwd;
    private $email;
    private $isVerify;
    private $articles = [];

    public function __construct($id,$name,$pwd,$email,$isVerify){
        $this->id = $id;
        $this->name = $name;
        $this->pwd = $pwd;
        $this->email = $email;
        $this->isVerify = $isVerify;
    
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