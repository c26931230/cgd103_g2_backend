<?php
//跨域
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");

try{
    require_once("../connect_cgd103g2.php");
    $sql = "insert into emp values (null, :emp_name, :job, :hiredate, :emp_pwd, :emp_mail,:emp_state)";
    
    // 編譯
    $products = $pdo->prepare($sql);
    $products->bindValue(":emp_name",$_POST["emp_name"]);
    $products->bindValue(":job",$_POST["job"]);
    $products->bindValue(":hiredate",$_POST["hiredate"]);
    $products->bindValue(":emp_pwd",$_POST["emp_pwd"]);
    $products->bindValue(":emp_mail",$_POST["emp_mail"]);
    $products->bindValue(":emp_state",$_POST["emp_state"]);
    
    $products->execute();

    $msg = "新增成功";
}catch(PDOException $e){
    $msg = "錯誤行號: ".$e->getLine().",錯誤訊息: " .$e->getMessage();
}

$result = ["msg"=>$msg];
echo json_encode($result);
?>