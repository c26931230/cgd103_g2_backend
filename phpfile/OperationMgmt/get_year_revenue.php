<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "select sum(s.month_rev + o.month_rev) as 'year_rev' from order_revenue o join sub_revenue s on o.month = s.month;";
  // $sql = "select * from emp";
  $member = $pdo->query($sql);
  $memRow = $member->fetch(PDO::FETCH_ASSOC);
  $data = $memRow;
//   foreach ($memRows as $memRow) {
//       $data[] = $memRow[3]; //月營收
//   }
  echo json_encode($data);
?>