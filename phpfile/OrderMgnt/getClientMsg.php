<?php
	//跨域，以下code參考empList.php，只有改變sql的名稱
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = 
  "SELECT * FROM client
  ORDER BY client.clientmes_time DESC ";

  $employee = $pdo->query($sql);
  $empRows = $employee->fetchAll();
  $data = [];
  foreach ($empRows as $empRow) {
      $data[] = $empRow;
  }
  echo json_encode($data);
?>