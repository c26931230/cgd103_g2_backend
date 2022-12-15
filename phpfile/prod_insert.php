<?php
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
try {
    require_once("../connect_cgd103g2.php");

    $data = json_decode(file_get_contents('php://input'), true);
    // $list = '{"product_name":"qwe","hashtag":"rty","unit_price":"123","product_state":"0","product_maintype":"下身","product_type":"長褲","product_pic":"螢幕擷取畫面 2022-12-08 150109.png","style_type":"文青風","body_type":"矩形","product_gender":"1","product_color":"#cd0e0e","product_size":"XS,S,M"}';
    // $data = json_decode($list);
    //sql 指令
    $sql = "INSERT INTO product VALUES(null,:product_name, :hashtag, :unit_price, :product_state, :product_maintype, :product_type, :product_pic, :style_type, :body_type, :product_gender, :product_color, :product_size) ";
    //編譯, 執行
    $products = $pdo->prepare($sql);
    $products->bindValue(":product_name", $data->product_name);
    $products->bindValue(":hashtag", $data->hashtag);
    $products->bindValue(":unit_price", $data->unit_price);
    $products->bindValue(":product_state", $data->product_state);
    $products->bindValue(":product_maintype", $data->product_maintype);
    $products->bindValue(":product_type", $data->product_type);
    $products->bindValue(":product_pic", $data->product_pic);
    $products->bindValue(":style_type", $data->style_type);
    $products->bindValue(":body_type", $data->body_type);
    $products->bindValue(":product_gender", $data->product_gender);
    $products->bindValue(":product_color", $data->product_color);
    $products->bindValue(":product_size", $data->product_size);
    $products->execute();

    $msg = "新增成功";
} catch (PDOException $e) {
    $msg = "錯誤行號 : " . $e->getLine() . ", 錯誤訊息 : " . $e->getMessage();
}

//輸出結果
$result = ["msg" => $msg];
echo json_encode($result);
?>