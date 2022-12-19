<?php
	//跨域
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "select level_id,  count(mem_id) from member
  group by level_id;";
  $member = $pdo->query($sql);
  $memRows = $member->fetchAll();
  $data = [];
  foreach ($memRows as $memRow) {
      // $data[] = $memRow[0]; //月
      $data[] = $memRow[1]; //人數
  }
  echo json_encode($data);
?>