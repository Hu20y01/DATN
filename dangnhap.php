<?php
include "connect.php";
$email = $_POST['email'];
$pass = $_POST['password'];
$query = "SELECT * FROM `user` where `email` ='$email' and `password`='$pass' ";
$data = mysqli_query($conn,$query);
$result = array();
 while ($row = mysqli_fetch_assoc($data))
{
     $result[] = ($row);
}
if(!empty($result)){
	$arr = [
    'success' => true,
    'message' => "thành công" ,
    'result'   =>$result
    ];
} else{

	$arr =  [
    'success' => false ,
    'message' => "không thành công" ,
 ]  ; 

}

echo (json_encode($arr));

?>