<?php
	//跨域，以下code參考empList.php，只有改變sql的名稱
    //連到訂單管理頁面
	header('Access-Control-Allow-Origin:*');
	header("Content-Type:application/json;charset=utf-8");

  require_once("../../connect_cgd103g2.php");
  $sql = "select * from orders";
   $sql = "SELECT *
                FROM (
                    (orders
                    INNER JOIN order_qa
                    ON orders.mem_id=order_qa.mem_id
                     )
            INNER JOIN order_item
            ON orders.order_id=order_item.order_id
            )
    INNER JOIN product
    ON order_item.product_id=product.product_id        
    ORDER BY orders.order_id ";

  $employee = $pdo->query($sql);
  $empRows = $employee->fetchAll();
  $data = [];
  foreach ($empRows as $empRow) {
      $data[] = $empRow;
  }
  echo json_encode($data);
?>