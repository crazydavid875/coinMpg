<?php
class Input{
    private static $fulluri;
    private static $uri;
    private static $perms;
    private static $method;
    public static function Init(){
        Input::$fulluri = $_SERVER['REQUEST_URI'];
        Input::$method = $_SERVER['REQUEST_METHOD'];
        Input::$uri = explode("back/",$_SERVER['REQUEST_URI'])[1];
        Input::$perms = explode("/",Input::$uri);
        session_start();
    }
    public static function getFullURI(){
        return Input::$fulluri;
    }
    public static function getURI(){
        return Input::$uri;
    }
    public static function getPerms($index){
        return Input::$perms[$index];
    }
    public static function getJsonData(){
        $json = file_get_contents('php://input');
        $data = json_decode($json,true);
        return $data;
    }
    public static function getPostData(){
        $data = $_POST;
        return $data;
    }
    public static function getMethod(){
        return Input::$method;
    }
    public static function setSession($key,$val){
        $_SESSION[$key] = $val;
    }
    public static function getSession($key){
        return $_SESSION[$key];
    }
}