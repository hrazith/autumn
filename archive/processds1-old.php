<?php
	session_start();
	include_once("connect.php");

// If this is a completely new application then create an application at CustAppInfo
// and make sesssion variable for appId.
// Use the appId to inserst a new CustProfileInfo1

 
	


	
		$sql1 = "CALL procDS160CustPersonalInfo2Update(
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
		



	mysqli_close($dbCon);
?>

