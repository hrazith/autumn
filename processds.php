<?php
	session_start();
	include_once("connect.php");

// If this is a completely new application then create an application at CustAppInfo
// and make sesssion variable for appId.
// Use the appId to inserst a new CustProfileInfo1


 	if ($_SESSION['newapp']){

		$sql = "CALL procCustAppInfoInsert(
			'{$_SESSION['id']}',
			'{$_SESSION['countryid']}',
			'{$_SESSION['visaid']}',
			'{$_SESSION['appnumber']}'
			)";

		if (mysqli_query($dbCon, $sql)) {

			$result = mysqli_query($dbCon, "SELECT CustAppInfoId FROM custappinfo WHERE CustAppNumber='{$_SESSION['appnumber']}'");
				while($row = mysqli_fetch_assoc($result)) {
		        	$_SESSION['appId'] = $row["CustAppInfoId"];
		    	}

			echo "Record created successfully. Id: ".$_SESSION['appId'];

		}
	}

// Check if application already exists. If it does then update InfoTable
// else Insert a new row in InfoTable

	
	function InsertOrUpdate($tbl,$db,$data) {

		$app_exists = mysqli_fetch_row(mysqli_query($db,"SELECT * FROM $tbl WHERE CustAppInfoId='{$_SESSION['appId']}'"));
		
		($app_exists) ? $direction = "Update" : $direction = "Insert";
		$sql = "CALL procDS160".$tbl.$direction.$data;

		if (mysqli_query($db, $sql)) {
			echo "Record ".$direction." successfull ";
		} else {
			echo mysqli_error($db);
		}
	}

	$tblname1 	= "custpersonalinfo1";
	$tblname2 	= "custpersonalinfo2";
	$tblname3 	= "custpersonalinfo3";
	$data1		= "(
					'{$_SESSION['appId']}', 
					'{$_REQUEST['fname']}',
					'{$_REQUEST['lname']}',
					'{$_REQUEST['nname']}',
					'{$_REQUEST['onames']}',
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
					'{$_REQUEST['taxid']}',
					'{$_REQUEST['address']}',
					'{$_REQUEST['city']}'
					)";
	$data2		= "(
					'{$_SESSION['appId']}', 
					'{$_REQUEST['state']}',
					'{$_REQUEST['zip']}',
					'{$_REQUEST['country']}',
					'{$_REQUEST['smaddress']}',
					'{$_REQUEST['maddress']}',
					'{$_REQUEST['mcity']}',
					'{$_REQUEST['mstate']}',
					'{$_REQUEST['mzip']}',
					'{$_REQUEST['mcountry']}',
					'{$_REQUEST['homephone']}',
					'{$_REQUEST['workphone']}',
					'{$_REQUEST['fax']}',
					'{$_REQUEST['cell']}',
					'{$_REQUEST['email']}',
					'{$_REQUEST['pptnumber']}',
					'{$_REQUEST['pptbook']}',
					'{$_REQUEST['pptissue']}',
					'{$_REQUEST['pptcity']}'
					)";
	$data3		= "(
					'{$_SESSION['appId']}', 
					'{$_REQUEST['pptstate']}',
					'{$_REQUEST['pptcountry']}',
					'{$_REQUEST['pptissdate']}',
					'{$_REQUEST['pptexpdate']}',
					'{$_REQUEST['pptstolen']}'
					)";
	InsertOrUpdate($tblname1,$dbCon,$data1);
	InsertOrUpdate($tblname2,$dbCon,$data2);
	InsertOrUpdate($tblname3,$dbCon,$data3);



	

	mysqli_close($dbCon);
?>

