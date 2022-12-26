<?php
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
try {
    require_once("../connect_cgd103g2.php");
    $data = json_decode(file_get_contents('php://input'));

    //sql 指令
    $sql = "UPDATE product SET product_name='$data->product_name',hashtag='$data->hashtag' ,unit_price='$data->unit_price', product_state='$data->product_state' ,product_maintype='$data->product_maintype' ,product_type='$data->product_type' ,product_pic='$data->product_pic' ,style_type='$data->style_type' ,body_type='$data->body_type' ,product_gender='$data->product_gender', product_color='$data->product_color' ,product_color_name='$data->product_color_name' ,product_size='$data->product_size',product_text='$data->product_text' WHERE product_id = '$data->product_id'  ; ";
    //編譯 執行
    $products = $pdo->prepare($sql);

    $products->execute();

    $msg = "success";
} catch (PDOException $e) {
    $msg = "fail";
    $msg = "error : " . $e->getLine() . ", 錯誤訊息 : " . $e->getMessage();
}

//輸出結果
$result = ["msg" => $msg];
echo json_encode($result);

?>