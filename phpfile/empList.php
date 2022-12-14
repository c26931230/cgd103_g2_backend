<?php
	//跨域(正式開發不能這樣)
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");
try{
	require_once("../connect_cgd103g2.php");
	$sql = "select * from emp";
    $employee = $pdo->prepare($sql);
    $employee->execute();
    $empRows = $employee->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($empRows);

}catch(PDOException $e){
    $result = ["msg"=>"error"];
    // echo "error";
    echo json_encode($result);
  }
?>