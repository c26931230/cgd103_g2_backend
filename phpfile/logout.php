<?php
//跨域
session_start();
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
session_unset();
?>


