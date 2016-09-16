Hello
<?php
	include_once("connect.php");

	$result = mysqli_query($dbCon, "CALL procGetAppId('APP0020224B-2')");
	while($row = mysqli_fetch_assoc($result)) {
        echo "id: " . $row["CustAppInfoId"]."<br>";
    }


 
	mysqli_close($dbCon);
?>

