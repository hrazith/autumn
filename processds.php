<?php
	session_start();
	include_once("connect.php");

// If this is a completely new application then create an application at CustAppInfo
// and make sesssion variable for appId.
// Use the appId to inserst a new CustProfileInfo1

 
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


		$sql2 = "CALL procDS160CustPersonalInfo1Insert(
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
			'{$_REQUEST['nid']}',
			'{$_REQUEST['ssn']}',
			'{$_REQUEST['taxId']}',
			'{$_REQUEST['address']}',
			'{$_REQUEST['city']}'
			)";

		if (mysqli_query($dbCon, $sql2)) {
			echo "Record inserted successfully";
			$_SESSION['newapp']=0;
		}

// If the user had already initiated an application then 
// then simply upadate the existing CustProfileInfo1


	} else {
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
			'{$_REQUEST['nid']}',
			'{$_REQUEST['ssn']}',
			'{$_REQUEST['taxId']}',
			'{$_REQUEST['address']}',
			'{$_REQUEST['city']}'
			)";

		if (mysqli_query($dbCon, $sql1)) {
			echo "Record updated successfully";
		} else {
			echo mysqli_error($dbCon);
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

