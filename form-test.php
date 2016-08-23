<?php
    include_once("connect.php");

	$columns =  mysqli_query($dbCon,"SHOW COLUMNS FROM CustPersonalInfo"); 
	$result2 = mysqli_fetch_row(mysqli_query($dbCon,"SELECT * FROM CustPersonalInfo WHERE CustAppInfoId = '43'"));
	$i=0;
?>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
	</head>
	<body>
	<?php
		
		while($row = mysqli_fetch_array($columns)){
			echo $row['Field']." ".$result2[$i]."<br>";
			$cust[$row['Field']] = $result2[$i];	
			$i++;
		}

		echo "Customer name is " . $cust['Last_Name'];

	?>
	<input type="text" name="myField1" value="<?php echo isset($cust['Last_Name']) ? $cust['Last_Name'] : '' ?>" />

	</body>
</html>

<?php mysqli_close($dbCon); ?>