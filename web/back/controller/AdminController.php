<?php
class AdminController{
    private $adminRepo;
    public function __construct(){
        $this->adminRepo = new AdminRepo();
    }
    public function getMembers(){
        $res = $this->adminRepo->findAllMember();
        $keys = array_keys($res[0]);
        $mode = "member";
        include($_SERVER['DOCUMENT_ROOT']."/template/adminTable.php");
    }
    public function getMemberIds(){
        $res =  $this->adminRepo->findAllMember();
        return $res;
    }
    public function getArticles(){
        $res = $this->adminRepo->findAllArticle();
        $keys = array_keys($res[0]);
        $mode = "article";
        include($_SERVER['DOCUMENT_ROOT']."/template/adminTable.php");
    }
    public function getAdminPage(){
        include($_SERVER['DOCUMENT_ROOT']."/template/adminPage.php");
    }
    public function login(){
        $data = Input::getPostData();
        $member = $this->adminRepo->login($data["email"],$data["pwd"]);
        
        Input::setSession("USERID",$member->id);
        $this->getAdminPage();
        Output::Success();
        
    }
    public function logout(){
        Input::setSession("USERID","");
        Output::Success();
    }
    public function isLogin(){
        $adminRepo = $this->adminRepo ;
        $id = Input::getSession("USERID");
        if($id==null) Output::NotFound("admin account");
        $adminRepo->isAdmin($id);

    }
    public function getloginpage(){
        include($_SERVER['DOCUMENT_ROOT']."/template/adminLogin.php");
    }
}
?>