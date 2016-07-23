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


$sql = " CREATE TABLE dbo.CountryList
 (
	 CountryListId INT NOT NULL IDENTITY(1,1) constraint pk_CountryList primary key,
	 CountryName VARCHAR(500)
 )";

if ($conn->query($sql) === TRUE) {
    echo "Table MyGuests created successfully";
} else {
    echo "Error creating table: " . $conn->error;
}

$conn->close();
?>

