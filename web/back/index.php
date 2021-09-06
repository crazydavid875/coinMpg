<?php 
    
    //include_once('./class/mpg.php');
    //include_once('./class/article.php');
    //include_once('./class/member.php');
    
    //include_once('./class/SQL.php');
    //include_once('./route.php');
    foreach (glob("base/*.php") as $filename)
    {
        include_once($filename);
    }
    foreach (glob("model/*.php") as $filename)
    {
        include_once($filename);
    }
    foreach (glob("Repository/*.php") as $filename)
    {
        include_once($filename);
    }
    foreach (glob("controller/*.php") as $filename)
    {
        include_once($filename);
    }
    
    Input::Init();
    Output::Init();
    SQL::Init();
    $router = new Router();
    $router->Route(Input::getMethod(),Input::getPerms(0),Input::getPerms(1));

    

    