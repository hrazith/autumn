<?php
	session_start();
	include_once("connect.php");


 
	if ($_SESSION['newapp']==1){

		$sql = "INSERT INTO CustAppInfo (
			CustProfileInfoId,
			CountryListId,
			CountryVisaTypeListId,
			CustAppNumber,
			CreatedOn
			) VALUES (
			'{$_SESSION['id']}',
			'{$_SESSION['countryid']}',
			'{$_SESSION['visaid']}',
			'{$_SESSION['appnumber']}',
			CURRENT_TIMESTAMP
			)";

		if (mysqli_query($dbCon, $sql)) {
			$_SESSION['appId'] = mysqli_insert_id($dbCon);
			echo "Record created successfully";
		}

		$sql2 = "INSERT INTO CustPersonalInfo (
			CustAppInfoId,
			Sex,
			First_Name,
			Last_Name
			) VALUES (
			'{$_SESSION['appId']}',
			'{$_REQUEST['gender']}',
			'{$_REQUEST['fname']}',
			'{$_REQUEST['lname']}'
			)";

		if (mysqli_query($dbCon, $sql2)) {
			echo "Record inserted successfully";
			$_SESSION['newapp']=0;
		}


	} else {

		$sql1 = "UPDATE CustPersonalInfo SET 
			Sex = '{$_REQUEST['gender']}',
			First_Name = '{$_REQUEST['fname']}',
			Last_Name = '{$_REQUEST['lname']}'
			WHERE 
			CustAppInfoId='{$_SESSION['appId']}'";
		//update Modified in appInfoId table 
		if (mysqli_query($dbCon, $sql1)) {
			echo "Record updated successfully";
		}

		$sql2 = "UPDATE CustAppInfo SET
			ModifiedOn = CURRENT_TIMESTAMP
			WHERE
			CustAppInfoId='{$_SESSION['appId']}'";
		if (mysqli_query($dbCon, $sql2)) {
			echo "Timestamped!";
		}

	}

	mysqli_close($dbCon);
?>

