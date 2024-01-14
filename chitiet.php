<?php
include "connect.php";
$page = $_POST['page'];
$total = 8; //can lay 20 san pham tren 1 trang
$pos = ($page-1)*$total; //0.5 5.5
$danhMuc = $_POST['danhMuc'];

// $query = 'SELECT * FROM `sanphammoi` WHERE `danhmuc` = '.$danhMuc.' LIMIT '.$pos.','.$total.'';

// if ($danhMuc <= 0) {
//     $query = 'SELECT * FROM `sanphammoi` LIMIT '.$pos.','.$total.'';
// }

$query = 'SELECT * FROM `sanphammoi` WHERE `danhmuc` = '.$danhMuc . ' ORDER BY id DESC';

if ($danhMuc <= 0) {
    $query = 'SELECT * FROM `sanphammoi` ORDER BY ID DESC';
}


$data = mysqli_query($conn, $query);
$result = array();
while($row = mysqli_fetch_assoc($data)){
	$result[] = ($row);
} 
 
if(!empty($result)){
	$arr = [
        'success' => true,
        'message' => "thành công",
        'result' => $result 
	    ];     
}
else{
	
	$arr = [
        'success' => false,
        'message' => "không thành công",
        'result' => $result 
	    ];   
}

print_r(json_encode($arr));

?>