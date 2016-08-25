<?php
    include_once("connect.php");

	$columns =  mysqli_query($dbCon,"SHOW COLUMNS FROM CustPersonalInfo"); 
	$result2 = mysqli_fetch_row(mysqli_query($dbCon,"SELECT * FROM CustPersonalInfo WHERE CustAppInfoId = '43'"));
	
	$sql = "SELECT count(*) FROM information_schema.columns WHERE table_schema = 'autumn' AND table_name = 'CustPersonalInfo'";
	$numColumns = mysqli_fetch_array(mysqli_query($dbCon,$sql));

	$sql2="SELECT 
	ISNULL(CustPersonalInfoId) + 
	ISNULL(First_Name) + 
	ISNULL(Last_Name) +
	ISNULL(Other_Name_Used) + 
	ISNULL(Other_Name_1) + 
	ISNULL(Other_Name_3)
	AS cnt
	FROM CustPersonalInfo
	WHERE CustAppInfoId='43'";

	$result= mysqli_query($dbCon,$sql2); 
	$row2 = mysqli_fetch_array($result);

	$i=0;
	$txt = "SELECT ";
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
		echo "Total number of Colums:".$numColumns[0]."<br/>"; 
		echo "xxx:".$row2['cnt']."<br/>";
		while($row = mysqli_fetch_array($columns)){
			echo $row['Field']." ".$result2[$i]."<br>";
			$cust[$row['Field']] = $result2[$i];	
			$txt = $txt."ISNULL(".$row['Field'].") + ";
			$i++;
			
		}
		$txt=$txt." ISNULL(CustPersonalInfoId) AS cnt FROM CustPersonalInfo WHERE CustAppInfoId='43'";

		echo "Customer name is " . $cust['Last_Name'];

	?>
	<input type="text" name="myField1" value="<?php echo isset($cust['Last_Name']) ? $cust['Last_Name'] : '' ?>" />
	<?php echo $txt; ?>

	</body>
</html>

<?php mysqli_close($dbCon); ?>