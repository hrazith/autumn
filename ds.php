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
					<li><?php echo date("Y-m-d") ?></li>
					<li> <a class="save" href="#">Save</a></li>
					<li> <a class="save" href="#">Close</a></li>
				</ul>
				</form>
			</div>
		</header>
		<div class="content-intake">
			<div class="intake-inner">
				<div class="intro">
					<h1 data-localize="greeting"> DS-160</h1>
					<p id="result">Online Nonimmigrant Visa Application form, is for temporary travel to the United States, and for K (fiancé(e)) visas. Form DS-160 is submitted electronically to the Department of State website via the Internet. Consular Officers use the information entered on the DS-160 to process the visa application and, combined with a personal interview, determine an applicant’s eligibility for a nonimmigrant visa.
					</p>
					<input type="submit" name="submit" class="primary rounded" value="Start" id="start"/>
					<p> <?php echo $_SESSION['id'].$_SESSION['appId'] ?>  </p>
				</div>
				<?php include_once("fragments/ds160/step1.php"); ?>
				<?php include_once("fragments/ds160/step2.php"); ?>
				<?php include_once("fragments/ds160/step3.php"); ?>
			</div>
		</div>

		<div class="actions-panel">
			<div id="progress">
  				<div id="bar"></div>
			</div>
			<div class="formnav">
				<input type="submit" name="submit" class="primary rounded" value="Back" id="back"/>	
				<input type="submit" name="submit" class="primary rounded" value="Next" id="next"/>
			</div>		
		</div>

		<script src="scripts/behaviors.js"></script>
	</body>
</html>