<?php
include "connect.php";
$tensp = $_POST['tensp'];

$query = 'INSERT INTO sanpham(tensanpham) VALUES ("'.$tensp.'")';
$data = mysqli_query($conn,$query);

if ($data == true) {
    $arr = [
        'success' => true,
        'message' => "Thành Công"
    ];
} else {
    $arr = [
        'success' => false,
        'message' => "Không Thành Công"
    ];
}

print_r(json_encode($arr));

?>