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
	<div class="qBuilder">
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
		<div class="qContent">
			<div class="intake-inner"> 
				<div class="intro">
					<h1 data-localize="greeting"> DS-160</h1>
					<?php 
						if ($_SESSION['newapp']==1): 
							include_once("fragments/ds160/instructions-newapp.php"); else: 
							include_once("fragments/ds160/instructions-existingapp.php"); 
						endif; 
					?>
				</div>
				<?php include_once("fragments/ds160/step1.php"); ?>
				<?php include_once("fragments/ds160/step2.php"); ?>
				<?php include_once("fragments/ds160/step3.php"); ?>
				<?php include_once("fragments/ds160/step4.php"); ?>
				<?php include_once("fragments/ds160/step5.php"); ?>
				<?php include_once("fragments/ds160/step6.php"); ?>
				<?php include_once("fragments/ds160/step7.php"); ?>
				<?php include_once("fragments/ds160/step8.php"); ?>
				<?php include_once("fragments/ds160/step9.php"); ?>
				<?php include_once("fragments/ds160/step10.php"); ?>
				<?php include_once("fragments/ds160/step11.php"); ?>

			</div>
		</div>

		<div class="qFooter">
			<div class="progress">
  				<div class="bar"></div>
			</div>
			<div class="qMenu">
				<span class="naked">Menu</span>
			</div>
			
			<nav class="qStepper hide">
				<ul>
					<li class="prev primary disabled"><a href="#">Prev</a></li>
					<li class="next primary"><a href="#">Next</a></li>
				</ul>
			</nav>
	
		</div>
	</div> 
	<script type="text/javascript">
		$("#country-select").val('<?php echo $cust["Nationality"];?>');
		$("#countr").val('<?php echo isset($cust['Country']) ? $cust['Country'] : 'Choose...';?>');
		$("#mcountry").val('<?php echo isset($cust['Mailing_Country']) ? $cust['Mailing_Country'] : 'Choose...';?>');
	</script>

	<script src="scripts/qbuild.js"></script>
	</body>
</html>