<?php
	session_start();
	include_once("connect.php");
	
	/*$percentComplete = 30;
	$i=0;
	$txt = "SELECT ";
	
	//Query for total number of applications a User has. 
	//Note: this does not yet check for application is active or not.
	$applications = mysqli_fetch_assoc(mysqli_query($dbCon,
		"SELECT count(*) as total FROM CustAppInfo WHERE CustProfileInfoId='{$_SESSION['id']}'"));

	//All application IDs in an array -- This is not DRY :(
	$appids = mysqli_query($dbCon, 
		"SELECT CustAppInfoId FROM CustAppInfo WHERE CustProfileInfoId='{$_SESSION['id']}'");

	//Query for total number of columns/entires in the DS160 application. 
	$entries = mysqli_fetch_assoc(mysqli_query($dbCon,
		"SELECT count(*) as total FROM information_schema.columns WHERE table_schema = 'autumn' AND table_name = 'CustPersonalInfo'"));

	//Query to fetch all the DS-160 columns 
	$columns =  mysqli_query($dbCon,"SHOW COLUMNS FROM CustPersonalInfo"); 

	//Create query string to check for NULL values
	while($row = mysqli_fetch_array($columns)){
		$qString = $qString."ISNULL(".$row['Field'].") + ";
		$i++;	
	}
	$qString=$qString." ISNULL(CustPersonalInfoId) AS cnt FROM CustPersonalInfo WHERE CustAppInfoId='8'";

	echo "Total DS-160 entires:".$entries['total']."<br/>";
	//echo "Query String:".$qString;
	while($roww = mysqli_fetch_assoc($appids)) {
        echo "Application ID: ".$roww["CustAppInfoId"]."<br>";
    }*/


    $sql = "CALL procGetProfileInfoWithAppPercentageCompleted(
			'{$_SESSION['id']}'
			)";
	if (mysqli_query($dbCon, $sql)) {
			echo "Success!!";
		} else {
			echo mysqli_error($dbCon);
		}


	/*$result = mysqli_query($dbCon, $sql);
	while($row = mysqli_fetch_assoc($result)) {
			$percentComplete=$row["AppPercentageCompleted"];;
		}

	echo $percentComplete;*/
		
?>



		<div class="application">
			<h3> App Name </h3>
			<div class="progress">
  				<div class="bar"></div>
			</div>
		</div>




		<script type="text/javascript">
			var percentComplete=<?php echo $percentComplete ?>;
		</script>
	

 
<?php	
	mysqli_close($dbCon);
?>

