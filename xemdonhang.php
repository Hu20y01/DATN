<?php
include "connect.php";
$iduser = $_POST['iduser'];

$query = 'SELECT * FROM donhang WHERE iduser = '.$iduser.' ORDER BY id DESC';
$data = mysqli_query($conn, $query);
$result = [];

while ($row = mysqli_fetch_assoc($data)) {
    $truyvan = 'SELECT * FROM chitietdonhang RIGHT JOIN sanphammoi ON chitietdonhang.idsp=sanphammoi.id WHERE chitietdonhang.iddonhang = '.$row['id'];
    $data1 = mysqli_query($conn, $truyvan);
    $item = [];

    while($row1 = mysqli_fetch_assoc($data1)){
        $item[] = $row1;
    }

    if ($item) {
        $row['item'] = $item;
        $result[] = $row;
    }
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