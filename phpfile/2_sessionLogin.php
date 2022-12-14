<?php
//跨域(正式開發不能這樣)
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
$memId = $_POST["memId"];
$memPsw = $_POST["memPsw"];
$errMsg = "";

try{
    require_once("../connect_cgd103g2.php");

    $sql = "select * from member where mem_id = :memId";

    $member = $pdo->prepare($sql);
    $member->bindValue(":memId", $memId);
    // $member->bindValue(":memPsw", $memPsw);
    $member->execute();

    if($member->rowCount() == 0){
        // .???
        $errMsg .= "帳密錯誤, <a href='1_sessionLogin.html'>重新登入</a>";
    }else{
        $memRow = $member->fetch(PDO::FETCH_ASSOC);
        session_start();
        $_SESSION["memId"] = $memRow["mem_id"];
        // $_SESSION["memName"] = $memRow["memName"];
        // $_SESSION["email"] = $memRow["email"];
        // $_SESSION["tel"] = $memRow["tel"];
    }
}
catch (PDOException $e){
    $errMsg .= "錯誤 : ".$e -> getMessage()."<br>";
    $errMsg .= "行號 : ".$e -> getLine()."<br>";
}
?>

    <?php
    if($errMsg != ""){
        echo $errMsg;
    }else{
        
        // echo $memRow["memName"],"Hi~<br>";
        echo "<a href='3_sessionMember.php'>前往會員專區</a>";
    }
    ?>
