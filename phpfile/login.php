<?php
//跨域
session_start();
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
// header('Access-Control-Allow-Origin:http://127.0.0.1:8080');
// header('Access-Control-Allow-Credentials:true');
$emp_id = $_POST["emp_id"];
$emp_pwd = $_POST["emp_pwd"];
$msg = "";
try{
    require_once("../connect_cgd103g2.php");

    $sql = "select * from `emp` where emp_id=:emp_id and emp_pwd=:emp_pwd";

    $employee = $pdo->prepare($sql);
    $employee->bindValue(":emp_id",$emp_id);
    $employee->bindValue(":emp_pwd",$emp_pwd);
    $employee->execute();

    if($employee->rowCount() == 0){
        $msg .="帳密錯誤";
    }else{
        $empRow = $employee->fetch(PDO::FETCH_ASSOC);

        // 登入成功後，將登入者資料寫入cookie
        // setcookie("emp_id", $empRow["emp_id"],time()+60);
        // setcookie("emp_name", $empRow["emp_name"],time()+60);
        // setcookie("email", $empRow["email"],time()+60);
        $_SESSION["emp_id"] = $empRow["emp_id"];
        $_SESSION["emp_name"] = $empRow["emp_name"];
        $msg .="登入成功";
    }
}catch(PDOException $e){
    $msg .= "錯誤: ".$e -> getMessage()."<br>";
    $msg .= "行號: ".$e -> getLines()."<br>";
}
$result = ["msg"=>$msg];
echo json_encode($result);
?>


