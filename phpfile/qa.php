<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../connect_cgd103g2.php");
  $sql = "SELECT a.* , m.mem_name FROM appointment a join member m on a.mem_id = m.mem_id ORDER BY a.appointment_date ASC";
  $appointment = $pdo->query($sql);
  $qaRows = $appointment->fetchAll();
  $data = [];
  foreach ($qaRows as $qaRow) {
      $data[] = $qaRow;
  }
  echo json_encode($data);
?>