<?php
	error_reporting(E_ALL & ~E_NOTICE);
	

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
				

				$sql = "CALL procInsert('43', 'Rupert', 'Evens', 'NativeEvans')";
				


				if (mysqli_query($dbCon, $sql)) {
					echo "Record inserted successfully";
				} else {
					
					echo mysqli_errno($sql) . ": " . mysqli_error($sql) . "\n";
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