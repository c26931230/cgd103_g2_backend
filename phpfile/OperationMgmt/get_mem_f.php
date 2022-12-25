<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "SELECT months.month, COUNT(member.mem_id)
  FROM (
   SELECT 7 as month UNION SELECT 8 as month
    UNION SELECT 9 as month UNION SELECT 10 as month UNION SELECT 11 as month UNION SELECT 12 as month
  ) as months
  left join member ON MONTH(member.mem_date) = months.month AND sex = 0 AND YEAR(member.mem_date) = 2022
  GROUP BY months.month
  order by months.month
  ;";
  $member = $pdo->query($sql);
  $memRows = $member->fetchAll();
  $data = [];
  foreach ($memRows as $memRow) {
      $data[] = $memRow[1]; //人數
  }
  echo json_encode($data);
?>