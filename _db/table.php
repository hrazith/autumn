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

// sql to create table
$sql = "CREATE TABLE CustPersonalInfo
 (
	  CustTravelInfo_ID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	  Sur_Name VARCHAR(500),
	  Given_Name VARCHAR(500),
	  Full_Name_In_Native_Language VARCHAR(500),
	  Other_Name_Used VARCHAR(50),
	  Other_Name_1 VARCHAR(500),
	  Other_Name_2 VARCHAR(500),
	  Other_Name_3 VARCHAR(500),
	  Sex VARCHAR(50),
	  Marital_Status VARCHAR(50),
	  Date_Of_Birth VARCHAR(100),
	  Place_Of_Birth VARCHAR(500),
	  Nationality VARCHAR(500),
	  Other_Nationalities VARCHAR(500),
	  National_Identification_Number VARCHAR(100),
	  US_Social_Security_Number VARCHAR(100),
	  US_Taxpayer_ID_Number VARCHAR(100),
	  Home_Address VARCHAR(500),
	  City VARCHAR(200),
	  State_Province VARCHAR(200),
	  PostalZone_ZIPCode INT,
	  Country VARCHAR(500),
	  Same_Mailing_Address VARCHAR(50),
	  Mailing_Home_Address VARCHAR(500),
	  Mailing_City VARCHAR(200),
	  Mailing_State_Province VARCHAR(200),
	  Mailing_PostalZone_ZIPCode INT,
	  Mailing_Country VARCHAR(500),
	  Home_Phone_Number VARCHAR(50),
	  Work_Phone_Number VARCHAR(50),
	  Work_Fax_Number VARCHAR(50),
	  Mobile_Cell_Phone_Number VARCHAR(50),
	  Email_Address VARCHAR(500),
	  Passport_Number VARCHAR(100),
	  Passport_Book_Number VARCHAR(100),
	  Country_Authority_Issued_Passport VARCHAR(500),
	  City_Issued_Passport VARCHAR(200),
	  State_Province_Issued_Passport VARCHAR(200),
	  Country_Issued_Passport VARCHAR(200),
	  Issuance_Date_Passport VARCHAR(100),
	  Expiration_Date_Passport VARCHAR(100),
	  Passport_Stolen_Lost VARCHAR(50)
 )";

if ($conn->query($sql) === TRUE) {
    echo "Table MyGuests created successfully";
} else {
    echo "Error creating table: " . $conn->error;
}

$conn->close();
?>

