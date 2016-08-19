<div class="discovery rounded visaschk-form hide">
	<p>What is your nationality?</p>
	<div class="select">
		<form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?> method="post">
			<select name="country" id="country-select">
				<option>Where do you want to go?</option>
				<?php
					$result = $dbCon->query($sql);	
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
	</div>
	<a href="#" class="done">done</a>	
</div>