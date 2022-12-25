<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "SELECT o.month, s.month_rev, o.month_rev, s.month_rev + o.month_rev FROM order_revenue o JOIN sub_revenue s ON o.month = s.month;";
  $member = $pdo->query($sql);
  $memRows = $member->fetchAll();
  $data = [];
  foreach ($memRows as $memRow) {
      $data[] = $memRow[3]; //月營收
  }
  echo json_encode($data);
?>