<?php
include "connect.php";
$tensp = $_POST['tensp'];
$id = $_POST['id'];

$query = 'UPDATE sanpham SET tensanpham="'.$tensp.'" WHERE id = ' . $id;
$data = mysqli_query($conn,$query);
if($data == true){
    $arr = [
        'success' => true,
        'message' => "Thành Công"
    ];
}else{
    $arr = [
        'success' => false,
        'message' => "Không Thành Công"
    ];
}

print_r(json_encode($arr));

?>