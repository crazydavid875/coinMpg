<?php
class ArticleRepo{
    private $table = 'article';
    public function __construct(){

    }
    public function findAll($uid){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT DISTINCT  article.*,record.paytime   
        FROM article LEFT outer JOIN (paymentItem as item,paymentrecord as record) 
        on (item.aid = article.id  and item.rid=record.id) WHERE article.uid='$uid'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $articles = [];
            foreach($result as $article){
                array_push($articles,new Article($article));
            }
            return $articles;
        }
    }
    public function find($id){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT DISTINCT  article.*,record.paytime 
        FROM article LEFT outer JOIN (paymentItem as item,paymentrecord as record) 
        on (item.aid = article.id  and item.rid=record.id) WHERE article.id='$id'");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            
            return new Article($result[0]);
        }
    }
    
    public function insert($uid,$article){
        $title = $article->title;    
        $auth = $article->auth;
        $paperid= $article->paperid;   
        $pagecount = $article->pagecount;              
        

        $table = $this->table;
        $query = "INSERT INTO $table
        (`title`, `auth`, `uid`, `paperid`, `pagecount`) 
        VALUES ('$title','$auth','$uid','$paperid','$pagecount')";
        
        $isSuccess = SQL::Insert($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else if($isSuccess==0){
            Output::NotFound('Article');
        }
        else{
            return SQL::getResult();
        }
    }
    public function update($id,$data){
        $table = $this->table;
        $set = '';
        $columns = Article::$columns;
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