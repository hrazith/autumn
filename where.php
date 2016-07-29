<?php
    include_once("connect.php");
	$sql = "SELECT CountryName FROM CountryList";
	$result = $dbCon->query($sql);
?>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<header> 
			<div class="logo"> Autumn</div>
			<div class="global-nav">
				<form method ="post" action="logout.php">
				<ul>
					<li class="date"> June 13, 2015</li>
					<li class="date"> <?php echo $email; ?></li>
					<li> <a><i class="icon-settings"></i>Settings</a></li>
					<li> <input type="submit" name="submit" class="naked" value="Log Out"/></li>
				</ul>
				</form>
			</div>
		</header>
		<div class="hero">	
			&nbsp;
		</div>
		<div class="content">
			<div class="grid major-silos">
				<div class="col-1-1">
					<div class="discovery rounded">
						<h2>Visit</h2>
						<div class="destination">
							<div class="select">
								<select name="countries" onchange="showContext(this.value)">
									<option>Where do you want to go?</option>
									<?php
							  			if ($result->num_rows > 0) {
							                // output data of each row
							                while($row = $result->fetch_assoc()) {
							                    echo "<option>". $row["CountryName"]."</option>";
							                }
							            } else {
							                echo "0 results";
							            } 
							  		?>
							  	</select>
						  	</div>
						  	<p>&nbsp;</p>
						  	<img src="images/world_map.svg" width="100%">
						</div>
					</div>
				</div>
				<div id="instructions">
					<p>Bitcchin text here!</p>
				</div>
			</div>
			
		</div>
		<script type="text/javascript">
			function showContext(context) {

				var words, acronym, nextWord;
				words = context.split(' ');
				acronym= "";
				index = 0
    
			    while (index<words.length) {
			    nextWord = words[index];
			    acronym = acronym + nextWord.charAt(0);
			    index = index + 1 ;
			    }

			    acronym = acronym.toLowerCase() + "a.html"

				var xhttp;
				if (context == "") {
					document.getElementById("instructions").innerHTML = "";
					return;
				}
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (xhttp.readyState == 4 && xhttp.status == 200) {
						document.getElementById("instructions").innerHTML = xhttp.responseText;
					}
				};
				xhttp.open("GET", acronym, true);
				xhttp.send();

				alert(acronym);
			}
		</script>
		
	</body>

</html>

<?php $conn->close(); ?>
