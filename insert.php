<?php
    $servername = "localhost";
    $username = "root";
    $password = "root";

    $dbname = "autum";

    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    $sql = "INSERT INTO Vitals (firstname, lastname, sex, maritalstatus, birth_date, birth_place)
    VALUES ('$_POST[firstname]', '$_POST[lastname]', '$_POST[gender]', '$_POST[mstatus]', '$_POST[birtdate]', '$_POST[birthplace]')";

    if ($conn->query($sql) === TRUE) {
        $last_id = $conn->insert_id;
        echo "New record created successfully. Last inserted ID is: " . $last_id;
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close(); 
?>