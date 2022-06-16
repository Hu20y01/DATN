<?php
include "connect.php";
$email = $_POST['email'];
$password = $_POST['password'];
$newpassword = $_POST['newpassword'];

//check data trung
$query = "SELECT `password` FROM `user` WHERE `email` = '$email'";
$data = mysqli_query($conn,$query);
$numrow = mysqli_num_rows($data); // ktra co du lieu tra ve khong
if($numrow <0)
    {
      $arr =
      [
        'message' => "Mật khẩu sai"
      ];
      
    }
else
    {
    //
    $update = "UPDATE `user` set `password`='$newpassword' where `email`='$email' ";
    $data = mysqli_query($conn,$update);

if($data == true)
{
	$arr = [
    'success' => true,'message'=>"Đổi mật khẩu Thành công"];
}   
else{

	$arr = [
    'success' => false,'message'=>"Đổi mật khẩu thất bại"];

}
}

echo (json_encode($arr));


?>