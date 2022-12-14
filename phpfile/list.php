<?php
	//跨域(正式開發不能這樣)
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");
try{

	
	require_once("../connect_cgd103g2.php");
	
	$sql = "select * from member where mem_id = :memId";
  $member = $pdo->prepare($sql);
  $member->bindValue(":memId", $_GET["memId"]);
  $member->execute();

  if( $member->rowCount() !=0){ //此帳號已存在, 不可用
    echo "此帳號已存在, 不可用";
  }else{ //此帳號可使用
    echo "此帳號可使用";
  } 
}catch(PDOException $e){
    echo "error";
  }
?>