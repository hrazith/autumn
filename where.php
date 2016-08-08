<?php
	error_reporting(E_ALL & ~E_NOTICE);
	session_start();

	if (isset($_SESSION['id'])) {
		$userId = $_SESSION['id'];
		$email = $_SESSION['email'];
	} else {
		header('Location: index.php');
		die();
	}

    include_once("connect.php");
	$sql = "SELECT CountryName FROM CountryList";
	$result = $dbCon->query($sql);	
?>
<!DOCTYPE html>
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
					<div class="destination-selector">
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
					</div>
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
				</div>
			</div>
			
		</div>
		

		<script type="text/javascript">
			function showContext(context) {

			var words, acronym, nextWord;
			words = context.split(' ');
			acronym = "";
			index = 0

			while (index < words.length) {
				nextWord = words[index];
				acronym = acronym + nextWord.charAt(0);
				index = index + 1;
			}

			acronym = acronym.toLowerCase() + ".php"

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

			//alert(acronym);

			}
		</script>
		
	</body>

</html>

<?php mysqli_close($dbCon); ?>

