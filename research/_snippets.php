<script type="text/javascript">
	//Jquery for current page URL
	var CurrentPageURL = $(location).attr("href");
	
</script>


<?php 
	$country = $_POST["country"];
	//one-liner for quering the result ito a variable
	$row = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryListId FROM CountryList WHERE CountryName='United States'")); 
	echo $row[0]; //still 2 lines :(  


	//the template
	$rowarray = mysqli_fetch_row(mysqli_query($dbCon,"~query~"));


	$appnumber = "APP"."00".$userId.$row[0].$visatype.$country;
	//using a variable inisde a query
	$sql = "SELECT CustProfileInfoId, EmailAddress, Password FROM CustProfileInfo WHERE EmailAddress = '$email' AND Activated = '1' LIMIT 1";
?>