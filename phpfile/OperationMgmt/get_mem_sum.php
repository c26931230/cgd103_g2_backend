<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  // $sql = "select month(mem_date), count(*) from member
  // where year(mem_date) = 2022
  // group by month(mem_date)
  // order by mem_date
  // ;";
  $sql = "SELECT months.month, COUNT(member.mem_id)
  FROM (
   SELECT 7 as month UNION SELECT 8 as month
    UNION SELECT 9 as month UNION SELECT 10 as month UNION SELECT 11 as month UNION SELECT 12 as month
  ) as months
  left JOIN member ON MONTH(member.mem_date) = months.month
  GROUP BY months.month
  ORDER BY months.month
  ;";
  $member = $pdo->query($sql);
  $memRows = $member->fetchAll();
  $data = [];
  foreach ($memRows as $memRow) {
      // $data[] = $memRow[0]; //月
      $data[] = $memRow[1]; //人數
  }
  echo json_encode($data);
?>