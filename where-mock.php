<?php
    include_once("connect.php");
	$sql = "SELECT CountryName, CountryCode FROM CountryList";
	$result = $dbCon->query($sql);	
?>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	</head>
	<body>

<div class="content">
	<form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?> method="post">

		<select name="country" id="country-select">
			<option>Where do you want to go?</option>
			<?php
	  			if ($result->num_rows > 0) {
	                // output data of each row
	                while($row = $result->fetch_assoc()) {
	                    echo "<option data-code='".$row["CountryCode"]."' >". $row["CountryName"]."</option>";
	                }
	            } else {
	                echo "0 results";
	            } 
	  		?>
		</select>
	 </form>

	

	<div id="instructions">
		<div class="discovery rounded">
			<div class="stat-overlay">
				<h3>28</h3>
				<p>visa-free countries. See if you have more, answer a <a href="#">few simple questions</a> </p>
			</div>
			<div class="destination">
			  	<img src="images/world_map.svg" width="100%">
			</div>
		</div>
	</div>

	<?php if (!empty($_POST)): ?>
	    <p> Welcome!<br>
	    	Your country is <?php echo htmlspecialchars($_POST["country"]); ?>.<br>
	   	</p>
	   	<script type="text/javascript">
	    		$("#country-select").val('<?php echo $_POST["country"];?>');
	    		var code= 'us';
		    	var url = "fragments/"+code+"1.php";
		    	$("#instructions").load(url);
		    	//alert(url);
	    </script>
	<?php else: ?>
		<p> You need to log in!</p>  
	<?php endif; ?>


	<script type="text/javascript">
		$('#country-select').change(context);
		function context(){
			$(this).parents("form").submit();
		}	
	</script>

</div>

</body>
</html>
<?php mysqli_close($dbCon); ?>