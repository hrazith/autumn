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


	while($row = mysqli_fetch_assoc(mysqli_query($dbCon, "CALL procLoadDS160('{$_SESSION['id']}', '{$_SESSION['countryid']}', '{$_SESSION['visaid']}')"))){
	$percentComplete=floor((count(array_filter($row))/count($row))*100);
	//create an array with key, value pair corresponding column names and its entry
		foreach($row as $key => $value) {
			$cust[$key] = $value;
		}
	}
	mysqli_close($dbCon);
	echo $percentComplete;
	echo "what the".$cust['State_Province'];




?>

<!-- send the claculated pecentage to jquery, stored in a variable -->
<script type="text/javascript">
	var percent = "<?php echo $percentComplete; ?>";
</script>