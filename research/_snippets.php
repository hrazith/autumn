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

	//using session variables in query
	$sql = mysql_query("INSERT INTO $tbl_name VALUES('','$eventname','{$_SESSION['myusername']}')");

	// setting value in form if it already exists in db
	value="<?php echo isset($cust['Last_Name']) ? $cust['Last_Name'] : '' ?>"

	

?>

//**FORM**//

How to access PHP session variables from jQuery function in a .js file?

I was struggling with the same problem and stumbled upon this page. Another solution I came up with would be this :
In your html, echo the session variable (mine here is $_SESSION['origin']) to any element of your choosing : <p id="sessionOrigin"><?=$_SESSION['origin'];?></p>
In your js, using jQuery you can access it like so : $("#sessionOrigin").text();
EDIT: or even better, put it in a hidden input

<input type="hidden" name="theOrigin" value="<?=$_SESSION['origin'];?>"></input>


<option value="January"<?=$row['month'] == 'January' ? ' selected="selected"' : '';?>>January</option>

<input type="radio" name="sex" value="Male" <?php echo ($sex=='Male')?'checked':'' ?>>Male
