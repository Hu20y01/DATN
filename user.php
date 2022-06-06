<?php
include "connect.php";

$query = "SELECT * FROM `user` ";
$data = mysqli_query($conn,$query);
$result = array();
 while ($row = mysqli_fetch_assoc($data))
		{
			$result = ($row);
		}
		if(!empty($result)){
			$arr = [
				$result 
				];   

		}   
		else{

			$arr =  [
					$result 
				];   

		}

echo (json_encode($arr));

?>