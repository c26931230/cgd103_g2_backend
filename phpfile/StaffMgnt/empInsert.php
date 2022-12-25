<?php
//跨域
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");

try{
    require_once("../../connect_cgd103g2.php");
    $a = $_POST["emp_mail"];
    $b = $_REQUEST["emp_mail"];
    $c = $_REQUEST["action"];
    // echo json_encode(gettype($a));//STRING
    // echo json_encode(gettype($b));//STRING
    // echo json_encode(gettype($c));//STRING
    // echo json_encode($c);//check_email or add_emp
    if($_REQUEST["action"] === "add_emp"){
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
    }else if($_REQUEST["action"] === "check_email"){
        require_once("../../connect_cgd103g2.php");
        $sql = "SELECT * from emp where emp_mail=:emp_mail;";
        $employee = $pdo->prepare( $sql );
        $employee->bindValue(":emp_mail", $a);
        $employee->execute();//執行之
        if ($employee->rowCount() == 1) { // 已有帳號
            // $errMsg = "此帳號已註冊";
            $msg = "此帳號已註冊";
        }else{
            $msg = "帳號可使用";
        }
        
    }
}catch(PDOException $e){
    $msg = "錯誤 : ".$e -> getMessage();
    $msg .= ", 行號 : ".$e -> getLine();
}

// $result = ["msg"=>$msg, "errMsg"=>$errMsg];
$result = ["msg"=>$msg];
echo json_encode($result);
// echo $result;
?>