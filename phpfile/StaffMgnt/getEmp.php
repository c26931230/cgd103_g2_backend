<?php
//跨域
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
try{
    require_once("../../connect_cgd103g2.php");
    $sql = "select * from emp where emp_id = ?";
    $employee = $pdo->prepare($sql);
    $employee->bindValue(1,$_GET["emp_id1"]);
    $employee->execute();
    $empRow = $employee->fetch(PDO::FETCH_ASSOC);
    echo json_encode($empRow);
}catch(PDOException $e){
    $result = ["msg"=>"錯誤，通知系統維護人員"];
    echo json_encode($result);
}
?>