<?php
	error_reporting(E_ALL & ~E_NOTICE);
	session_start();

	if (isset($_SESSION['id'])) {
		$userId = $_SESSION['id'];
		$email = $_SESSION['email'];
	} else {
		header('Location: index.php');
		die();
	}

	include_once("connect.php");
?>
<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
	</head>
	<body>
		
		<div class="content-intake">
			<div class="intake-inner"> 
			<h2> DS-160 Store Proc Test</h2>

			<?php
				
				$result = mysqli_query($dbCon, "CALL procLoadDS160('{$_SESSION['id']}', '{$_SESSION['countryid']}', '{$_SESSION['visaid']}')");

				 //loop the result set
				 while($row = mysqli_fetch_assoc($result)){
					//echo "Number of not null entries: ".count(array_filter($row))."<br/>";
					//echo "Number of total entries: ".count($row)."<br/>";
					echo "Percent completed :".floor((count(array_filter($row))/count($row))*100)."%";
					foreach($row as $key => $value) {
  						//echo "$key : $value <br/>";
  						$cust[$key] = $value;
					}
				}

			?>
				<input type="text" name="myField1" value="<?php echo isset($cust['First_Name']) ? $cust['First_Name'] : '' ?>" />
			</div>
		</div>
		

	</body>
</html>


<?php
	mysqli_close($dbCon);
?>