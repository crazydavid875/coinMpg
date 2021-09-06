<?php
class Mpg{
    static private $mer_key = 'YqA7bqiOuXLzCkhHIcHdTIOvvmNHq3zK';//'aCnIUANaxAs2E3ST6xnlCrIFs3ZWvcPZ';
    static private $mer_iv ='CwDIMI2Q4yZuRBxP'; //'PMmpEqHeomOCe7JC';
    static private $MerchantID = 'MS122480020';//'MS3515109187';
    
    static function mpg_encrypt($email,$orderId,$ItemName,$amt,$paytype){
        $MerchantID = MPG::$MerchantID;
        
        $trade_info_arr = array(
            'MerchantID' => $MerchantID,
            'RespondType' => 'JSON',
            'TimeStamp' => time(),
            'Version' => 1.6,
            'MerchantOrderNo' => $orderId,
            'Amt' => $amt,
            'ItemDesc' => $ItemName,
            'Email' => $email,
            'ReturnURL'=>'https://acl.csie.ntut.edu.tw/wocc/front/MemberPage/1/profile',
            'ClientBackURL'=>'https://acl.csie.ntut.edu.tw/wocc/front/MemberPage/1/profile',
            'NotifyURL'=>'https://acl.csie.ntut.edu.tw/back/payment/payNotify',
            'LangType'=>'en',
            'CREDIT'=>1,
            'VACC'=>1,
            'CVS'=>1,
            'BARCODE'=>1,
            'WEBATM'=>1
        );
        
         
        $aes = MPG::create_mpg_aes_encrypt ($trade_info_arr, Mpg::$mer_key, Mpg::$mer_iv);
        $hash = 'HashKey='.Mpg::$mer_key.'&'.$aes.'&HashIV='.Mpg::$mer_iv;
        $sha = strtoupper(hash("sha256", $hash));
        
        $trade_info = array(
            'MerchantID' => $MerchantID,
            'TradeInfo' => $aes,
            'TradeSha' => $sha,
            'Version' => 1.6,
        );
        return json_encode( $trade_info);
    }
    static function create_mpg_aes_encrypt ($parameter = "" , $key = "", $iv = "") {
        $return_str = '';
        if (!empty($parameter)) {
        //將參數經過 URL ENCODED QUERY STRING
        $return_str = http_build_query($parameter);
        }
        return trim(bin2hex(openssl_encrypt(MPG::addpadding($return_str), 'aes-256-cbc', $key, OPENSSL_RAW_DATA|OPENSSL_ZERO_PADDING, $iv)));
    }
    static function addpadding($string, $blocksize = 32) {
        $len = strlen($string);
        $pad = $blocksize - ($len % $blocksize);
        $string .= str_repeat(chr($pad), $pad);
        return $string;
    }
    static function mpg_decrypt($deTradeInfo){
        $deinfo = MPG::create_aes_decrypt($deTradeInfo,MPG::$mer_key,MPG::$mer_iv);
        
        //print_r($deinfo);
        //$arr =  explode("&",$deinfo);
        //$res = [];
        //foreach($arr as $item){
        //    $deitem = explode("=",$item);
        //    $res[$deitem[0]] = $deitem[1];
        //}
        
        return $deinfo;
    }
    static function create_aes_decrypt($parameter = "", $key = "", $iv = "") {
        return MPG::strippadding(openssl_decrypt(hex2bin($parameter),'AES-256-CBC',
        $key, OPENSSL_RAW_DATA|OPENSSL_ZERO_PADDING, $iv));
    }
    static function strippadding($string) {
        $slast = ord(substr($string, -1));
        $slastc = chr($slast);
        $pcheck = substr($string, -$slast);
        if (preg_match("/$slastc{" . $slast . "}/", $string)) {
        $string = substr($string, 0, strlen($string) - $slast);
        return $string;
        } else {
        return false;
        }
    }
}
/*
    $trade_info_arr = array(
    'MerchantID' => 3430112,
    'RespondType' => 'JSON',
    'TimeStamp' => 1485232229,
    'Version' => 1.4,
    'MerchantOrderNo' => 'S_1485232229',
    'Amt' => 40,
    'ItemDesc' => 'UnitTest'
    );
    $mer_key = '12345678901234567890123456789012';
    $mer_iv = '1234567890123456';
    //交易資料經 AES 加密後取得 TradeInfo
    $TradeInfo = create_mpg_aes_encrypt($trade_info_arr, $mer_key, $mer_iv);
    'MerchantOrderNo' => 'S_1485232229',
    'Amt' => 40,
    'ItemDesc' => 'UnitTest'
    */