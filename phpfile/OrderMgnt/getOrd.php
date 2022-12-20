<?php
	//跨域，以下code參考empList.php，只有改變sql的名稱
    //連到訂單管理頁面
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "select * from orders";
  $employee = $pdo->query($sql);
  $empRows = $employee->fetchAll();
  $data = [];
  foreach ($empRows as $empRow) {
      $data[] = $empRow;
  }
  echo json_encode($data);
?>