<?php
	session_start();
	include_once("connect.php");

// If this is a completely new application then create an application at CustAppInfo
// and make sesssion variable for appId.
// Use the appId to inserst a new CustProfileInfo1

 $app_exists = mysqli_fetch_row(mysqli_query($dbCon,"SELECT * FROM custpersonalinfo3 WHERE CustAppInfoId='{$_SESSION['appId']}'"));

	if ($app_exists) {

		$sql1 = "CALL procDS160CustPersonalInfo3Update(
			'{$_SESSION['appId']}', 
			'{$_REQUEST['pptstate']}',
			'{$_REQUEST['pptcountry']}',
			'{$_REQUEST['pptissdate']}',
			'{$_REQUEST['pptexpdate']}',
			'{$_REQUEST['pptstolen']}'
			)";

			if (mysqli_query($dbCon, $sql1)) {
				echo "Record updated successfully";
			} else {
				echo mysqli_error($dbCon);
			}

			$sql = "CALL procCustAppInfoModifiedOnUpdate(
				'{$_SESSION['appId']}')";
			if (mysqli_query($dbCon, $sql)) {
				echo " and timestamped!";
			}

	} else {

		$sql2 = "CALL procDS160CustPersonalInfo3Insert(
			'{$_SESSION['appId']}', 
			'{$_REQUEST['pptstate']}',
			'{$_REQUEST['pptcountry']}',
			'{$_REQUEST['pptissdate']}',
			'{$_REQUEST['pptexpdate']}',
			'{$_REQUEST['pptstolen']}'
			)";

			if (mysqli_query($dbCon, $sql2)) {
				echo "Record Inserted successfully";
			} else {
				echo mysqli_error($dbCon);
			}


	}


	mysqli_close($dbCon);
?>

