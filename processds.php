<?php
	session_start();
	include_once("connect.php");

// If this is a completely new application then create an application at CustAppInfo
// and make sesssion variable for appId.
// Use the appId then to write into all the ds160 tables

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
			echo $direction."d ";
		} else {
			echo mysqli_error($db);
		}
	}

	$tbl1 	= "custpersonalinfo1";
	$tbl2 	= "custpersonalinfo2";
	$tbl3 	= "custpersonalinfo3";
	$tbl4	= "custtravelinfo1";
	$tbl5 	= "custtravelinfo2";
	$tbl6 	= "CustUSContactWorkLocalContactPrepareInfo";
	$tbl7 	= "custfamilyinfo1";
	$tbl8 	= "custfamilyinfo2";


	$data1	= "(
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
	$data2	= "(
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
	$data3	= "(
				'{$_SESSION['appId']}', 
				'{$_REQUEST['pptstate']}',
				'{$_REQUEST['pptcountry']}',
				'{$_REQUEST['pptissdate']}',
				'{$_REQUEST['pptexpdate']}',
				'{$_REQUEST['pptstolen']}'
				)";
	$data4	= "(
				'{$_SESSION['appId']}', 
				'{$_REQUEST['principal']}',
				'{$_REQUEST['purposeofvisit1']}',
				'{$_REQUEST['purposeofvisit2']}',
				'{$_REQUEST['purposeofvisit3']}',
				'{$_REQUEST['purposeofvisit4']}',
				'{$_REQUEST['intarrival']}',
				'{$_REQUEST['intlength']}',
				'{$_REQUEST['usaddress']}',
				'{$_REQUEST['payingperson']}',
				'{$_REQUEST['ppfone']}',
				'{$_REQUEST['ppemail']}',
				'{$_REQUEST['ppsameaddress']}',
				'{$_REQUEST['pprelation']}',
				'{$_REQUEST['ppaddress']}',
				'{$_REQUEST['ppcity']}',
				'{$_REQUEST['ppstate']}',
				'{$_REQUEST['ppzip']}',
				'{$_REQUEST['ppcountry']}',
				'{$_REQUEST['otherstraveling']}'
				)";
	$data5	= "(
				'{$_SESSION['appId']}', 
				'{$_REQUEST['travelgroup']}',
				'{$_REQUEST['travelperson1']}',
				'{$_REQUEST['travelperson2']}',
				'{$_REQUEST['travelperson3']}',
				'{$_REQUEST['travelperson4']}',
				'{$_REQUEST['travelperson5']}',
				'{$_REQUEST['tprelation1']}',
				'{$_REQUEST['tprelation2']}',
				'{$_REQUEST['tprelation3']}',
				'{$_REQUEST['tprelation4']}',
				'{$_REQUEST['tprelation5']}',
				'{$_REQUEST['everbeentous']}',
				'{$_REQUEST['everissuedusvisa']}',
				'{$_REQUEST['everrefusedusvisa']}'
				)";
	$data6	= "(
				'{$_SESSION['appId']}', 
				'{$_REQUEST['uscontactpersonname']}',
				'{$_REQUEST['uscontactorgname']}',
				'{$_REQUEST['uscontactrelation']}',
				'{$_REQUEST['uscontactaddress']}',
				'{$_REQUEST['uscontactemail']}',
				'{$_REQUEST['uscontactphone']}',
				'{$_REQUEST['primaryoccupation']}',
				'{$_REQUEST['presentemployer']}',
				'{$_REQUEST['empaddress']}',
				'{$_REQUEST['empcity']}',
				'{$_REQUEST['empstate']}',
				'{$_REQUEST['empzip']}',
				'{$_REQUEST['empcountry']}',
				'{$_REQUEST['salary']}',
				'{$_REQUEST['empdescription']}',
				'{$_REQUEST['custcurrentlocation']}',
				'{$_REQUEST['assistance']}'
				)";

	InsertOrUpdate($tbl1,$dbCon,$data1);
	InsertOrUpdate($tbl2,$dbCon,$data2);
	InsertOrUpdate($tbl3,$dbCon,$data3);
	InsertOrUpdate($tbl4,$dbCon,$data4);
	InsertOrUpdate($tbl5,$dbCon,$data5);
	InsertOrUpdate($tbl6,$dbCon,$data6);



	

	mysqli_close($dbCon);
?>

