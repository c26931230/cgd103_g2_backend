<?php
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
try {
    require_once("../connect_cgd103g2.php");
    // echo (file_get_contents('php://input'));
    $data = json_decode(file_get_contents('php://input'));

    //sql 指令
    $sql = "INSERT INTO product VALUES(null, '$data->product_name', '$data->hashtag', '$data->unit_price', '$data->product_state', '$data->product_maintype', '$data->product_type', '$data->product_pic', '$data->style_type', '$data->body_type', '$data->product_gender', '$data->product_color', '$data->product_size'); ";
    //編譯, 執行
    $products = $pdo->query($sql);

    $products->execute();

    $msg = "success";
} catch (PDOException $e) {
    $msg = "fail";
    $msg = "錯誤行號 : " . $e->getLine() . ", 錯誤訊息 : " . $e->getMessage();
}

//輸出結果
$result = ["msg" => $msg];
echo json_encode($result);

// $sql = "INSERT INTO product VALUES(null, :product_name, :hashtag, :unit_price, :product_state, :product_maintype, :product_type, :product_pic, :style_type, :body_type, :product_gender, :product_color, :product_size); ";

// $products->bindValue(":product_name", $data->product_name, PDO::PARAM_STR);
// $products->bindValue(":hashtag", $data->hashtag, PDO::PARAM_STR);
// $products->bindValue(":unit_price", $data->unit_price, PDO::PARAM_INT);
// $products->bindValue(":product_state", $data->product_state, PDO::PARAM_INT);
// $products->bindValue(":product_maintype", $data->product_maintype, PDO::PARAM_STR);
// $products->bindValue(":product_type", $data->product_type, PDO::PARAM_STR);
// $products->bindValue(":product_pic", $data->product_pic, PDO::PARAM_STR);
// $products->bindValue(":style_type", $data->style_type, PDO::PARAM_STR);
// $products->bindValue(":body_type", $data->body_type, PDO::PARAM_STR);
// $products->bindValue(":product_gender", $data->product_gender, PDO::PARAM_INT);
// $products->bindValue(":product_color", $data->product_color, PDO::PARAM_STR);
// $products->bindValue(":product_size", $data->product_size, PDO::PARAM_STR);
?>