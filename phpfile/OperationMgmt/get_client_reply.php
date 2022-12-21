<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "SELECT count(*) 'reply' FROM client where reply != 1;";
  $member = $pdo->query($sql);
  $memRow = $member->fetch(PDO::FETCH_ASSOC);
  $data = $memRow;

  echo json_encode($data);
?>