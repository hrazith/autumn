<?php
	session_start();
	include_once("connect.php");

// If this is a completely new application then create an application at CustAppInfo
// and make sesssion variable for appId.
// Use the appId to inserst a new CustProfileInfo1

	

	function InsertOrUpdate($tbl,$dbCon,$data) {
		echo "session ID:".$_SESSION['appId'];

		$app_exists = mysqli_fetch_row(mysqli_query($dbCon,"SELECT * FROM $tbl WHERE CustAppInfoId='{$_SESSION['appId']}'"));
		
		($app_exists) ? $direction = "Update" : $direction = "Insert";
		$sql = "CALL procDS160".$tbl.$direction.$data;

		if (mysqli_query($dbCon, $sql)) {
			echo "Record ".$direction." successfull";
		} else {
			echo mysqli_error($dbCon);
		}
	}

	$tblname 	= "custpersonalinfo1";
	$data		= "(
					'87', 
					'Jenn',
					'Smith',
					'n/a',
					'no',
					'',
					'',
					'',
					'',
					'',
					'12/10/2000',
					'Barcelona',
					'Barx',
					'Spanish',
					'',
					'',
					'',
					'',
					'',
					''
					)";

	InsertOrUpdate($tblname,$dbCon,$data);




	

	



	

	mysqli_close($dbCon);
?>





