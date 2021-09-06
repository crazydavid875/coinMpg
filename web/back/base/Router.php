<?php
class Router{
    private $account ;
    public function Route($method,$service,$action){
        $this->account = new AccountController();
        if($service=='account'){
            $this->Account($method,$action); 
        }
        else if($service == 'article'){
            $this->Article($method,$action);
        }
        else if($service == 'payment'){
            $this->Record($method,$action);
        }
        else{
            Output::NotFound();
        }
    }
    private function Account($method,$action){
        $account = $this->account  ;
        if($method=='POST'){
            switch ($action) {
                case 'regist':
                    $account->regist();
                    break;
                case 'login':
                    $account->login();
                    break;
                case 'logout':
                    $account->logout();
                    break;
                case 'SendVerifyCode':
                    $account->SendVerifyCode();
                    break;
                case 'verifyEmail'://  ip/back/account/verifyEmail
                    $account->verifyEmail();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='GET'){
            switch ($action) {
                case 'info':
                    $account->isLogin();
                    $account->getInfo();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='PATCH'){
            switch ($action) {
                case '':
                    $account->isLogin();
                    $account->updateInfo();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else{
            Output::NotFound();
        }
    }
    private function Article($method,$action){
        $article = new ArticleController();
        $this->account->isLogin();
        if($method=='POST'){
            switch ($action) {
                case '':
                    $article->addArticle();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='GET'){
            switch ($action) {
                case '':
                    $article->getArticles();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='PATCH'){
            switch ($action) {
                case 'aid':
                    $article->SetArticle(Input::getPerms(2));
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='DELETE'){
            switch ($action) {
                case 'aid':
                    $article->DeleteArticle(Input::getPerms(2));
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        
        else{
            Output::NotFound();
        }
    }
    private function Record($method,$action){
        $record = new PaymenyController();
        
        if($method == 'POST'){
            switch ($action) {
                case 'payAll':
                    $this->account->isLogin();
                    $record->PayAll();
                    break;
                case 'getMPGRecord':
                    $this->account->isLogin();
                    $record->getMPGRecord(Input::getPerms(2));
                    break;
                case 'payNotify':
                    $record->payNotify();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }   
        else if($method=='GET'){
            switch ($action) {
                case 'record':
                    if(Input::getPerms(2)!=null)
                        $record->GetpayAmt(Input::getPerms(2));
                    else
                        $record->getPayRecord();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else{
            Output::NotFound();
        }
    }
}

