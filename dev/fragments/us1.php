
<?php
	session_start();
	include_once("connect.php");
	$row = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryListId FROM CountryList WHERE CountryName='United States'")); // US is hardcoded :(
	$roww = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryVisaTypeListId FROM CountryVisaTypeList WHERE CountryVisaType='B-2'"));

	$_SESSION['countryid'] = $row[0];
	$_SESSION['visatype'] = "B-2"; // hardcoded :(
	$_SESSION['visaid'] = $roww[0];
	$appnumber = "APP"."00".$_SESSION['id'].$_SESSION['countryid'].$_SESSION['visatype'];

?>
<div class="discovery rounded">
	<div class="stat-overlay">
		<h3>USA</h3>
		<h2>Step 1 </h2>
		<p>
			Fill up DS-160<br/>
			This really easy
		</p>

			<div class="actions btn">
				<input type="submit" name="submit" class="primary rounded" value="Start DS-160"/>
			</div>

	</div>
	<div class="destination">
		<img src="images/us.svg" width="60%">
	</div>
	
</div>



