<?php
	session_start();
	include_once("connect.php");

// If this is a completely new application then create an application at CustAppInfo
// and make sesssion variable for appId.
// Use the appId to inserst a new CustProfileInfo1

 
	if ($_SESSION['newapp']==1){

		$sql = "CALL procCustAppInfoInsert(
			'{$_SESSION['id']}',
			'{$_SESSION['countryid']}',
			'{$_SESSION['visaid']}',
			'{$_SESSION['appnumber']}'
			)";

		if (mysqli_query($dbCon, $sql)) {

			/*
				$result = mysqli_query($dbCon, "CALL procGetAppId('{$_SESSION['appnumber']}')");
					while($row = mysqli_fetch_assoc($result)) {
			        	$_SESSION['appId'] = $row["CustAppInfoId"];
			    	}
		    */

			/*
				// This works but gives MySQL server has gone away 
					$query = "CALL procGetAppId('{$_SESSION['appnumber']}')";
					if ($stmt = mysqli_prepare($dbCon, $query)) {
					    mysqli_stmt_execute($stmt);
					    mysqli_stmt_bind_result($stmt, $id);
					    while (mysqli_stmt_fetch($stmt)) {
					        $_SESSION['appId'] = $id;
					    }
					    mysqli_stmt_free_result($stmt);
					    mysqli_stmt_close($stmt);
					}
			*/

			
				// this works but not a proc
				$result = mysqli_query($dbCon, "SELECT CustAppInfoId FROM custappinfo WHERE CustAppNumber='{$_SESSION['appnumber']}'");
				while($row = mysqli_fetch_assoc($result)) {
		        	$_SESSION['appId'] = $row["CustAppInfoId"];
		    	}

	    	

			echo "Record created successfully. Id: ".$_SESSION['appId'];
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
		} else { echo mysqli_error($dbCon); }

// If the user had already initiated an application then 
// then simply upadate the existing CustProfileInfo1


	} else {
		$sql1 = "CALL procDS160CustPersonalInfo1Update(
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

