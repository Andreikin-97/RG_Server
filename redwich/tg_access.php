<?php 

//echo "ggggg";
$token_tg = "6415075149:AAEnF_qcg9l7mgCChz0OJyAGOlTXSlPO8kU";
//$token_tg = "5191091275:AAHFWXCmMgJY_gXh78hWmK3-TzQ8l-aGIgg";

$msg = iconv('Windows-1251', 'UTF-8',$_POST["msg"]);
$msg = urlencode($msg);

$id_user = $_GET["id_user"];

$httpsfile = file_get_contents("https://api.telegram.org/bot$token_tg/sendMessage?chat_id=$id_user&text=$msg");
echo $httpsfile;


?>