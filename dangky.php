<?php
include "connect.php";
$email = $_POST['email'];
$pass = $_POST['password'];
$username = $_POST['username'];
$phone = $_POST['phone'];

//check data trung
$query = "SELECT * FROM `user` WHERE `email` = '$email'";
$data = mysqli_query($conn,$query);
$numrow = mysqli_num_rows($data); // ktra co du lieu tra ve khong
if($numrow >0)
    {
      $arr =
      [
        'message' => "Email đã tồn tại"
      ];
      
    }
else
    {
    //insert du lieu
    $query = "INSERT INTO `user`(`email`, `username`, `phone`, `password`, `role`) VALUES ('$email','$username','$pass','$phone','user') ";
    $data = mysqli_query($conn,$query);

if($data == true)
{
	$arr = [
    'success' => true,'message'=>"Đăng ký thành công"];
}   
else{

	$arr = [
    'success' => false,'message'=>"Thất bại"];

}
}

echo (json_encode($arr));


?>