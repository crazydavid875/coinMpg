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

        $hasPaid=false;
        $hasPaidhasPaid = false;
        foreach($records as $record){
            if(!$record->getIspay()){
                if(count($record->items)<=0){
                    //$recordRepo->delete($record->id);
                }
                else{
                    foreach($record->items as $payitem){
                        
                        if($payitem->paymode=="without article"){
                            
                            $recordRepo->delete($record->id);
                        }
                        else if($payitem->paymode=='has paid base'){
                            $hasPaidhasPaid = true;
                        }
                    }
                }
            }
            else{
                foreach($record->items as $payitem){
                    if($payitem->paymode=="without article"){
                        $payIndent = $payitem->indent;
                        $hasPaid = true;
                    }
                    else if($payitem->paymode=='has paid base'){
                        
                        $hasPaidhasPaid = true;
                    }
                }
            }
        }
        //new a record and item
        
        $des = $article->paperid.", ".($member->isieee?'ieee member':'non ieee member');
        $newRecord = new Record(array('createtime'=>time(),'des'=>$des));
        $recordid = $recordRepo->insert($uid,$newRecord);
        $payitem = new PayItem(array(
            'paymode'=>"has article",
            'indent'=>($member->isieee?'ieee member':'non ieee member'),
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

        //has paid discount

        if($hasPaid&&!$hasPaidhasPaid&&isset($payIndent)){
            
            $payitem = new PayItem(array(
                'paymode'=>"has paid base",
                'indent'=>$payIndent,
                'page'=>1
            ));
            $payItemRepo->insert($recordid,$payitem);
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
            $this->DeleteArticle($id,true);
            $this->addArticle();
        } 
        else{//    Output::Error('Could not change pages while you has already paid for the paper ');
            $this->articleRepo->update($id,$data);
        }
        Output::Success();
    }
    //刪除論文
    public function DeleteArticle($id,$withoutexit = false){
        $data = Input::getJsonData();
        $uid = Input::getSession("USERID");
        $article = $this->articleRepo->find($id);
        $this->articleRepo->delete($id);
        $articles = $this->articleRepo->findAll($uid);
       
        $memberRepo = new MemberRepo();
        $recordRepo = new RecordRepo();
        $payItemRepo = new PayItemRepo();
        

        $member = $memberRepo->find($uid);
        $records = $recordRepo->findAll($uid);
        if(count($articles)<=0){    
            $haspaid = false;
            foreach($records as $record){
                if(!$record->getIspay()){
                    
                    $recordRepo->delete($record->id);
                    
                }
                else
                    $haspaid = true;
            }
            if($haspaid) {
                if($withoutexit)
                    Output::SuccessWithoutExit();
                else{
                    Output::Success();
                }
            }
            //if there have no record,add a empty record for non author
            $newRecord = new Record(array('createtime'=>time(),'des'=>'non author, '.($member->isstudent=='student'?'student':'non student')));
            
            $insertid = $recordRepo->insert($uid,$newRecord);
            $item = new PayItem(array(
                'paymode'=>"without article",
                'indent'=>($member->isstudent=='student'?'student':'non ieee member'),
                'page'=>1
            ));
            
            $payItemRepo->insert($insertid,$item);
        }
        else{
            
            
            foreach($records as $record){
                
                if(!$record->getIspay())
                { 
                    
                    $items = $payItemRepo->findAll($record->id);
                    $itemcount = count($items);
                    
                    if($itemcount<=0)
                        $recordRepo->delete($record->id);
                    else{
                        $record->items = $items;
                        
                        if($record->getTotal()<0){
                            $toBeStoreitem = $record->items[0];
                            $recordRepo->delete($record->id);
                        }
                        else{
                            $rid = $record->id;
                        }
                    }
                }
            }
            if(isset($rid)&&isset($toBeStoreitem)){
                $payItemRepo->insert($rid,$toBeStoreitem);
            }
        }
        if($withoutexit)
            Output::SuccessWithoutExit();
        else{
            Output::Success();
        }
    }
}