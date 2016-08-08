<?php
	session_start();
	include_once("connect.php");
	$row = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryListId FROM CountryList WHERE CountryName='United States'")); // US is hardcoded :(
	$roww = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryVisaTypeListId FROM CountryVisaTypeList WHERE CountryVisaType='B-2'"));

	$_SESSION['countryid'] = $row[0];
	$_SESSION['visatype'] = "B-2"; // hardcoded :(
	$_SESSION['visaid'] = $roww[0];

?>

<div class="discovery rounded">
	<div class="stat-overlay">
		<h3>United</h3>
		<h2>Step 1 </h2>
		<p>Fill up DS-160</p>
		<form method ="post" action="ds160-1.php">
			<div class="actions">
				<input type="submit" name="submit" class="primary rounded" value="Start DS-160"/>
			</div>
		</form>
	</div>
	<div class="destination">
		<img src="images/autumn-logo.svg" width="40%">
	</div>
	<?php 
		echo "Favorite country is " . $_SESSION["countryid"] . ".<br/>";
		echo "Favorite visa type is " . $_SESSION["visatype"] . ".<br/>";
		echo "Favorite visa Id is " . $_SESSION["visaid"] . ".<br/>";
		mysqli_close($dbCon);
	?>
</div>