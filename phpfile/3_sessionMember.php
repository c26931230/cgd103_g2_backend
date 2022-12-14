<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>session</title>
</head>
<body>
    <?php
    echo "id : ",session_id(),"<br>";
    //自 session 中取回登入者資料
    echo "帳號: ",$_SESSION["mem_id"], "<br>";
    // echo "姓名: ",$_SESSION["memName"], "<br>";
    // echo "email: ",$_SESSION["email"], "<br>";
    ?>
</body>
</html>