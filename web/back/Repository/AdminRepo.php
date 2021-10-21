<?php
class AdminRepo{
    private $table = 'user';
    public function __construct(){

    }
    public function findAllMember(){
        $isSuccess = SQL::Select("SELECT
        user.id,user.name,user.email,user.position,user.affiliation,user.tel,
        user.ieeeid,user.studentid,user.isveg,user.teamsid,
        (select count(ar.id) from payment.article as ar where ar.uid = user.id) as article_count,
        (select sum((select sum(pi.page*pm.amt) from payment.paymentItem as pi LEFT JOIN payment.paymode as pm
        ON pi.pid = pm.id WHERE pi.rid = pr.id )) from payment.paymentrecord as pr
        where user.id = pr.uid AND pr.paytime is NULL
        group by uid) as hasNotPaidAmt,
        (select sum((select sum(pi.page*pm.amt) from payment.paymentItem as pi LEFT JOIN payment.paymode as pm
        ON pi.pid = pm.id WHERE pi.rid = pr.id )) from payment.paymentrecord as pr
        where user.id = pr.uid AND pr.paytime is not NULL
        group by uid) as hasPaidAmt,
        (SELECT GROUP_CONCAT(title SEPARATOR ';') FROM payment.article WHERE article.uid = user.id GROUP by uid) as articleTitles
        FROM
        payment.user as user
        WHERE user.indentid<>3");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $members = [];
            foreach($result as $member){
                array_push($members,$member);
            }
            return $members;
        }
    }
    public function findAllArticle(){
        $isSuccess = SQL::Select("SELECT
        article.id,article.title,article.auth,article.paperid,article.pagecount,user.id as uid,user.name,user.email,
        (select sum(pi.page*pm.amt) from payment.paymentItem as pi LEFT JOIN payment.paymode as pm
        ON pi.pid = pm.id WHERE pi.aid = article.id ) as Amt,
        (select pr.paytime from payment.paymentItem as pi LEFT JOIN payment.paymentrecord as pr
        ON pi.rid = pr.id WHERE pi.aid = article.id LIMIT 1 ) as Paidtime
        FROM
        payment.user as user RIGHT JOIN payment.article on article.uid = user.id 
        WHERE user.indentid<>3");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $articles = [];
            foreach($result as $article){
                array_push($articles,$article);
            }
            return $articles;
        }
    }
    public function login($email,$pwd){
        $table = $this->table;
        $query = "SELECT * FROM $table WHERE email='$email' and pwd='$pwd' and indentid=3";
        $isSuccess = SQL::Select($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound("member");
        }
        else{
            $result = SQL::getResult();
            $member = new Member($result[0]);
            
            return $member;
        }
    }
    public function isAdmin($userid){
        $table = $this->table;
        $query = "SELECT * FROM $table WHERE id='$userid' and indentid=3";
        $isSuccess = SQL::Select($query);
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        elseif($isSuccess==0){
            Output::NotFound("member");
        }
        else{
            $result = SQL::getResult();
            $member = new Member($result[0]);
            
            return $member;
        }
    }
}