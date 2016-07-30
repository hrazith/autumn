<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "autumn";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


$result = mysqli_query("SELECT count(*) FROM CountryList");
$row = mysqli_fetch_row($result);
$num = $row[0];
echo $num;




$conn->close();

?>

