<?php 
//跨域
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");
    try{
        require_once("../connect_cgd103g2.php");
        //sql 指令
        $sql = "SELECT v.*,l.level_name,m.mem_name,s.style_name,b.body_shape
        FROM vip_orders v JOIN member m ON v.mem_id=m.mem_id
        JOIN vip_level l ON v.level_id=l.level_id
        JOIN body b ON m.body_id=b.body_id
        JOIN style s ON m.style_id=s.style_id
        WHERE v.sub_deadline>NOW()
        AND v.level_id IS NOT NULL;";
        //編譯, 執行
        $subOrder = $pdo->query($sql);
        $subOrderRows = $subOrder->fetchAll();
        $data = [];
        foreach ($subOrderRows as $i => $order) {
            $data[] = $order;
        }
        echo json_encode($subOrderRows);
    }catch (PDOException $e) {
        $errMsg .= "錯誤 : ".$e -> getMessage()."<br>";
        $errMsg .= "行號 : ".$e -> getLine()."<br>";
        echo json_encode(["msg"=>$errMsg]);
    }
?>    