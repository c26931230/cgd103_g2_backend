<!-- 後台 抓取會員資料 -->
<?php
header('Access-Control-Allow-Origin:*');
header("Content-Type:application/json;charset=utf-8");

require_once("../connectBooks.php");

$sql = "SELECT * FROM `member`;";
$member = $pdo->query($sql);
$members = $member->fetchAll();
// $memberRow = [];
// foreach ($members as $member) {
//     $memberRow[] = $member;
// }
echo json_encode($members);
?>
