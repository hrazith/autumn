<?php
	error_reporting(E_ALL & ~E_NOTICE);
	session_start();

	if (isset($_SESSION['id'])) {
		$appId = $_SESSION['appId'];
		echo $appId;
	} else {
		header('Location: index.php');
		die();
	}

    include_once("connect.php");   

    $sql = "INSERT INTO CustPersonalInfo (CustAppInfoId, Sex, Marital_Status)
    VALUES ('$appId', '$_POST[gender]', '$_POST[mstatus]' )";
	if (mysqli_query($dbCon, $sql)) {
		echo "success";
	} else {
	    echo "Error: " . $sql . "<br>" . mysqli_error($dbCon);
	}

	mysqli_close($dbCon);  

?>

<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div class="content">
			<div class="intro">
				<h2 data-localize="greeting"> DS-160</h2>
				<div id="progress">
  					<div id="bar"></div>
				</div>
			</div>
			<div class="inputbox ds160-intake shadow">
				<form method ="post" action="ds160-2.php">
					<div class="grid">
						<div class="col-1-2">
							<h2>Gender</h2>
							
						</div>
						<div class="col-1-2">
							<h2>Marital Status</h2>
							
						</div>
					</div>
					<?php echo $err; ?>
					<div class="actions">
						<input type="submit" name="submit" class="primary rounded" value="Back"/>	
						<input type="submit" name="submit" class="primary rounded" value="Next"/>		
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
<br>
  <br>