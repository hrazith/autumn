<?php
	session_start();
	include_once("connect.php");
 

	$sql = "UPDATE CustPersonalInfo SET First_Name= '{$_REQUEST['fname']}' WHERE CustAppInfoId='{$_SESSION['appId']}'";

	if (mysqli_query($dbCon, $sql)) {
	    echo "Record updated successfully";
	    //echo "You are:".$_REQUEST['fname']." ".$_REQUEST['gender']." ".$_REQUEST['mstatus']." App:".$_SESSION['appnumber']."visa type:";
	} else {
	    echo "Error updating record: " . mysqli_error($conn);
	}
	
	

	mysqli_close($dbCon);
?>

