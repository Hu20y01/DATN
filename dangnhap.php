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
    'message' => "thanh cong" ,
    $result ] ;     
}   
else{

	$arr =  [
    'success' => false ,
    'message' => "k thanh cong" ,
    $result ] ;     

}

echo (json_encode($arr));

?>