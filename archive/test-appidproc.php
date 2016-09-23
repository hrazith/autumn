Hello
<?php
	include_once("connect.php");

	/*$result = mysqli_query($dbCon, "CALL procGetAppId('APP0021224B-2')");
	while($row = mysqli_fetch_assoc($result)) {
        echo "id: " . $row["CustAppInfoId"]."<br>";
    }*/



$query = "CALL procGetAppId('APP0021224B-2')";
if ($stmt = mysqli_prepare($dbCon, $query)) {

    /* execute query */
    mysqli_stmt_execute($stmt);

    /* bind result variables */
    mysqli_stmt_bind_result($stmt, $id);

    /* fetch values */
    while (mysqli_stmt_fetch($stmt)) {
        echo $id;
    }

    /* free result */
    mysqli_stmt_free_result($stmt);

    /* close statement */
    mysqli_stmt_close($stmt);
}

 
	mysqli_close($dbCon);
?>

