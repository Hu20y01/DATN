<?php
include "connect.php";
    $id = $_POST['id'];

    $query = 'DELETE FROM sanphammoi WHERE id = '.$id.'';
    $data = mysqli_query($conn,$query);
        if($data == true){
            $arr = [
                'success' => true,
                'message' => "Thanh Cong"
            ];
        }else{
            $arr = [
                'success' => false,
                'message' => "Xoa Khong Thanh Cong"
            ];
        }

print_r(json_encode($arr));

?>