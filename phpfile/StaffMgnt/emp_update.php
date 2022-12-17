<?php 
//跨域
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
	try{
		require_once("../../connect_cgd103g2.php");
		//sql 指令
		$sql = "update emp set emp_name = :emp_name1, 
									job = :job1, 
									hiredate = :hiredate1, 
									emp_pwd = :emp_pwd1,
									emp_mail = :emp_mail1,
									emp_state = :emp_state1
				where emp_id = :emp_id1";
		//編譯, 執行
		$products = $pdo->prepare($sql);	
		$products->bindValue(":emp_id1", $_POST["emp_id1"]);
		$products->bindValue(":emp_name1", $_POST["emp_name1"]);
		$products->bindValue(":job1", $_POST["job1"]);
		$products->bindValue(":hiredate1", $_POST["hiredate1"]);
		$products->bindValue(":emp_pwd1", $_POST["emp_pwd1"]);
		$products->bindValue(":emp_mail1", $_POST["emp_mail1"]);
		$products->bindValue(":emp_state1", $_POST["emp_state1"]);
		$products->execute();					

	    $msg = "異動成功";
	} catch (PDOException $e) {
		$msg = "錯誤行號 : ".$e->getLine().", 錯誤訊息 : ".$e->getMessage();
	}	

echo json_encode(["msg"=>$msg]);
?>    