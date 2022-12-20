<?php
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
try {
    require_once("../connect_cgd103g2.php");
    $data = json_decode(file_get_contents('php://input'));

    //sql 指令
    $sql = "INSERT INTO product VALUES(null, '$data->product_name', '$data->hashtag', '$data->unit_price', '$data->product_state', '$data->product_maintype', '$data->product_type', '$data->product_pic', '$data->style_type', '$data->body_type', '$data->product_gender', '$data->product_color', '$data->product_size'); ";
    //編譯, 執行
    $products = $pdo->query($sql);


    $msg = "success";
} catch (PDOException $e) {
    $msg = "fail";
    $msg = "錯誤行號 : " . $e->getLine() . ", 錯誤訊息 : " . $e->getMessage();
}

//輸出結果
$result = ["msg" => $msg];
echo json_encode($result);

?>