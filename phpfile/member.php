<?php
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");

require_once("../connect_cgd103g2.php");

$sql = "SELECT vip_orders.*, member.mem_name, member.sex,member.bday, member.mem_pic , member.phone , member.mem_mail,  member.address,  member.body_id , member.style_id
 , member.mem_date 
 , member.chest  
 , member.shoulder 
 , member.waistline 
 , member.hip 
 , member.clothes 
 , member.pants  
 , member.shoesize 
 , member.height  
 , member.weight ,
 style.*,body.*
 FROM tibamefe_cgd103g2.member join vip_orders on member.mem_id =vip_orders.mem_id 
  LEFT JOIN style on member.style_id= style.style_id
    LEFT JOIN body on member.body_id= body.body_id
 order by vip_orders.sub_time  DESC  ;";
$member = $pdo->query($sql);
$members = $member->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($members);
?>