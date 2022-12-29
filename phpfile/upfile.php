<?php
header('Access-Control-Allow-Origin:*');
header("Content-Type:multipart/form-data;charset=utf-8");

// const MY_DIR = "../public/pic"; // 本地
const MY_DIR = "../../front/pic"; //上線

// 檢查是否有上傳的檔案
if (isset($_FILES['file'])) {
    // 取得檔案資訊
    $file = $_FILES['file'];

    // 取得檔案名稱
    $fileName = $file['name'];

    // 取得檔案临时位置
    $fileTemp = $file['tmp_name'];

    // 設定目標位置
    $targetPath = MY_DIR . '/' . $fileName;

    // 複製檔案至目標位置
    if (copy($fileTemp, $targetPath)) {
        // 複製成功
        echo json_encode([
            'status' => 'success',
            'message' => 'File was uploaded successfully.'
        ]);
    } else {
        // 複製失敗
        echo json_encode([
            'status' => 'error',
            'message' => 'Failed to upload file.'
        ]);
    }
}