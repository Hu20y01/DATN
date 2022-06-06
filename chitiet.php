<?php
include "connect.php";
    $page = $_POST['page'];
    $total = 8; //can lay 20 san pham tren 1 trang
    $pos = ($page-1)*$total; //0.5 5.5
    $loai = $_POST['loai'];

$query = 'SELECT * FROM `sanphammoi` WHERE `loai` = '.$loai.' LIMIT '.$pos.','.$total.'';

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