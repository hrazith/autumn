<p>
	You have an app already <br/>
	<?php 
		echo "session ID: ".$_SESSION['id']." Country ID: ".$_SESSION['countryid']."<br/>";
		echo "visa id: ".$_SESSION['visaid'];

	?>  
</p>
<input type="submit" name="submit" class="primary rounded" value="Start" id="start"/>
<br/>

<?php
	include_once("connect.php");
	//Call DS160 StoreProc and create an array, $cust[] 
	//to copy all the stored values. 

	$sql = "CALL procLoadDS160('21','224','2')";
	$result = mysqli_query($dbCon, $sql);



	if ($result) {
			echo "successfully";
		} else {
			mysqli_error($dbCon); 
		}

while($row = mysqli_fetch_assoc($result)){

		foreach($row as $key => $value) {
			$cust[$key] = $value;
		}
	}
	mysqli_close($dbCon);

	echo "what the".$cust['First_Name'];
?>

<!-- send the claculated pecentage to jquery, stored in a variable -->
<script type="text/javascript">
	var percent = "<?php echo $percentComplete; ?>";
</script>