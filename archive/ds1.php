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


?>
<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
	</head>
	<body>
		<header> 
			<div class="intake-utils">
				<form>

				<ul>
					<li id="status" class="alert"></li>
					<li><?php echo date("Y-m-d") ?></li>
					<li> <a class="save" href="#">Save</a></li>
					<li> <a href="profile.php">Close</a></li>
				</ul>
				</form>
			</div>
		</header>
		<div class="content-intake">
			<div class="intake-inner"> 
				<div class="intro">
					<h1 data-localize="greeting"> DS-1</h1>
					
				</div>
				<?php include_once("fragments/ds160/step7.php"); ?>
			</div>
		</div>
		<div class="actions-panel">
			<div class="progress">
  				<div class="bar"></div>
			</div>
			<div class="formnav">
				<input type="submit" name="submit" class="primary rounded" value="Back" id="back"/>	
				<input type="submit" name="submit" class="primary rounded" value="Next" id="next"/>
			</div>		
		</div>

		<script src="scripts/ds1-behaviors.js"></script>
	</body>
</html>