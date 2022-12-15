<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../connect_cgd103g2.php");
  $sql = "select * from emp";
  $employee = $pdo->query($sql);
  $empRows = $employee->fetchAll();
  $data = [];
  foreach ($empRows as $empRow) {
      $data[] = $empRow;
  }
  echo json_encode($data);
?>