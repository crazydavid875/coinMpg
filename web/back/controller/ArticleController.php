<?php
class ArticleController{
    private $articleRepo;
    public function __construct(){
        $this->articleRepo = new ArticleRepo();
    }
    //新增論文
    public function addArticle(){
        $data = Input::getJsonData();
        $uid = Input::getSession("USERID");
        //insert article
        $article = new Article($data);
        $insertid = $this->articleRepo->insert($uid,$article);
        //find has without Article and !ispay  record and delete
        $memberRepo = new MemberRepo();
        $recordRepo = new RecordRepo();
        $payItemRepo = new PayItemRepo();
        $memberBuilder= new MemberBuilder($memberRepo,$this->articleRepo,$recordRepo,$payItemRepo);
        $member = $memberBuilder->Build($uid);
        $where = false;
        $records = $member->paymentRecords;
        foreach($records as $record){
            if(!$record->getIspay()){
                foreach($record->items as $payitem){
                    
                    if($payitem->paymode=="without article"){
                        
                        $recordRepo->delete($record->id);
                    }
                }
            }
        }
        //new a record and item
        
        $des = $article->title.",".($member->isieee?'ieee member':'non ieee member');
        $newRecord = new Record(array('createtime'=>time(),'des'=>$des));
        $recordid = $recordRepo->insert($uid,$newRecord);
        $payitem = new PayItem(array(
            'paymode'=>"has article",
            'indent'=>$member->indent,
            'page'=>1
        ));
        $payItemRepo->insert($recordid,$payitem,$insertid);
        
        //extr page
        $pagecount = intval($article->pagecount);
        if($pagecount>5){
            $payitem = new PayItem(array(
                'paymode'=>"extra page",
                'page'=>$pagecount-5
            ));
            $payItemRepo->insert($recordid,$payitem,$insertid);
        }

        
        Output::Success('{"id":"'.$insertid.'"}');
        
    }
    
    //取得使用者論文
    public function getArticles(){
        $uid = Input::getSession("USERID");
        $articles = $this->articleRepo->findAll($uid);
        Output::Success(json_encode($articles));
        
    } 
    //修改論文
    public function SetArticle($id){
        $data = Input::getJsonData();
        $article = $this->articleRepo->find($id);
        //print_r( $article);
        if($data['pagecount']!=$article->pagecount){
            $this->DeleteArticle($id);
            $this->addArticle();
        } 
        else{//    Output::Error('Could not change pages while you has already paid for the paper ');
            $this->articleRepo->update($id,$data);
        }
        Output::Success();
    }
    //刪除論文
    public function DeleteArticle($id){
        $data = Input::getJsonData();
        $uid = Input::getSession("USERID");
        $article = $this->articleRepo->find($id);
        $this->articleRepo->delete($id);
        $articles = $this->articleRepo->findAll($uid);
        if(count($articles)<=0){
            $memberRepo = new MemberRepo();
            $recordRepo = new RecordRepo();
            $payItemRepo = new PayItemRepo();
            $member = $memberRepo->find($uid);
            $records = $recordRepo->findAll($uid);
            $haspaid = false;
            foreach($records as $record){
                if(!$record->getIspay())
                    $recordRepo->delete($record->id);
                else
                    $haspaid = true;
            }
            if($haspaid) Output::Success();
            $newRecord = new Record(array('createtime'=>time(),'des'=>'non author,'.($member->isstudent=='student'?'student':'non student')));
            
            $insertid = $recordRepo->insert($uid,$newRecord);
            $item = new PayItem(array(
                'paymode'=>"without article",
                'indent'=>$member->indent,
                'page'=>1
            ));
            
            $payItemRepo->insert($insertid,$item);
        }
        Output::SuccessWithoutExit();
    }
}