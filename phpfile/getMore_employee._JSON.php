<?php
try{
    require_once("../connect_cgd103g2.php");
    $sql = "select * from emp where emp_id=:emp_id";
    $emp = $pdo->prepare($sql);
    $emp->bindValue(":emp_id", $_GET["emp_id"]);
    $emp->execute();

    if($emp->rowCount() == 0){
        echo"{}";
    }else{
        $empRow = $emp->fetch(PDO::FETCH_ASSOC);

        $result = ["emp_id"=>$empRow["emp_id"],"emp_name"=>$empRow["emp_name"],"job"=>$empRow["job"],"hiredate"=>$empRow["hiredate"]];
        echo json_encode($result);
    }
}catch(PDOException $e){
    $result = ["errMsg"=>$e->getMessage()];
    echo json_encode($result);
}
?>