

<?php
	session_start();
	include_once("connect.php");

	$sql = "CALL procDS160CustPersonalInfo1Update(
			'{$_REQUEST['appId']}', 
			'{$_REQUEST['fname']}',
			'{$_REQUEST['lname']}',
			'{$_REQUEST['nname']}',
			'{$_REQUEST['onameUsed']}',
			'{$_REQUEST['oname1']}',
			'{$_REQUEST['oname2']}',
			'{$_REQUEST['oname3']}',
			'{$_REQUEST['gender']}',
			'{$_REQUEST['mstatus']}',
			'{$_REQUEST['dob']}',
			'{$_REQUEST['bcity']}',
			'{$_REQUEST['bstate']}',
			'{$_REQUEST['nationality']}',
			'{$_REQUEST['onationality']}',
			'{$_REQUEST['nid']}',
			'{$_REQUEST['ssn']}',
			'{$_REQUEST['taxId']}',
			'{$_REQUEST['address']}',
			'{$_REQUEST['city']}'
			)";

	


	/*$sql1 = "CALL procDS160CustPersonalInfo3Insert(
			'{$_REQUEST['appId']}', 
			'{$_REQUEST['issueState']}',
			'{$_REQUEST['issueDate']}',
			'{$_REQUEST['expDate']}',
			'{$_REQUEST['stolen']}',
			'No'
			)";

	$sql1 = "CALL procDS160CustPersonalInfo1Update(
			'{$_SESSION['appId']}', 
			'{$_REQUEST['fname']}',
			'{$_REQUEST['lname']}',
			'{$_REQUEST['nname']}',
			'{$_REQUEST['onameUsed']}',
			'{$_REQUEST['oname1']}',
			'{$_REQUEST['oname2']}',
			'{$_REQUEST['oname3']}',
			'{$_REQUEST['gender']}',
			'{$_REQUEST['mstatus']}',
			'{$_REQUEST['dob']}',
			'{$_REQUEST['bcity']}',
			'{$_REQUEST['bstate']}',
			'{$_REQUEST['nationality']}',
			'{$_REQUEST['onationality']}',
			'{$_REQUEST['ssn']}',
			'{$_REQUEST['taxId']}',
			'{$_REQUEST['address']}',
			'{$_REQUEST['city']}'
			)";*/

	if (mysqli_query($dbCon, $sql)) {
			echo  $_REQUEST['appId']." Record updated successfully";
		}
	mysqli_close($dbCon);
?>

