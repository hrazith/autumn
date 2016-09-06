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
			echo "Record created successfully".$_SESSION['appId'];
		}

		/*$sql2 = "INSERT INTO CustPersonalInfo (
			CustAppInfoId,
			Sex,
			Marital_Status,
			First_Name,
			Last_Name,
			Other_Name_Used
			) VALUES (
			'{$_SESSION['appId']}',
			'{$_REQUEST['gender']}',
			'{$_REQUEST['mstatus']}', 
			'{$_REQUEST['fname']}',
			'{$_REQUEST['lname']}',
			'{$_REQUEST['onames']}'
			)";*/


			$sql2 = "CALL procInsert(
			'{$_SESSION['appId']}', 
			'{$_REQUEST['fname']}',
			'{$_REQUEST['lname']}',
			'{$_REQUEST['nname']}'

			)";

		if (mysqli_query($dbCon, $sql2)) {
			echo "Record inserted successfully";
			$_SESSION['newapp']=0;
		}


	} else {

		$sql1 = "UPDATE CustPersonalInfo SET 
			Sex = '{$_REQUEST['gender']}',
			Marital_Status = '{$_REQUEST['mstatus']}', 
			First_Name = '{$_REQUEST['fname']}',
			Last_Name = '{$_REQUEST['lname']}',
			Other_Name_Used ='{$_REQUEST['onames']}'
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
			echo " and timestamped!";
		}

	}

	mysqli_close($dbCon);
?>

