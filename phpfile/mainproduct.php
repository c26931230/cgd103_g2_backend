<?php
// //跨域(正式開發不能這樣)
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");

require_once("../connect_cgd103g2.php");

$sql = "SELECT * FROM `product`where product_name is not Null;";
$book = $pdo->query($sql);
$books = $book->fetchAll();
$data = [];
foreach ($books as $i => $page) {
    $data[] = $page;
}
echo json_encode($data);
?>