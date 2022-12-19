<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "select o.month, s.month_rev, o.month_rev, s.month_rev + o.month_rev from order_revenue o join sub_revenue s on o.month = s.month;";
  // $sql = "select * from emp";
  $member = $pdo->query($sql);
  $memRows = $member->fetchAll();
  $data = [];
  foreach ($memRows as $memRow) {
      $data[] = $memRow[3]; //月營收
  }
  echo json_encode($data);
?>