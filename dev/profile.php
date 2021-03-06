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
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
	</head>
	<body>
		<?php include_once("fragments/header.php"); ?>
		<div class="content">
			<div class="subnav">
				<ul class="subnav-list">
					<li class="active"><a href="profile.php">Dashboard</a></li>
					<li><a href="#">Extended profile</a></li>
					<li><a href="#">Notifications</a></li>
					<li><a href="#">Travel History</a></li>
					<li><a href="#">Timeline</a></li>
				</ul>
			</div>
			<div class="dashboard rounded">
				<div class="grid">
					<div class="col-1-3">
						<div class="avatar">
							<img src="images/roon.png" width="40%">
							<h3><?php echo $_SESSION['username'] ?></h3>
						</div>
						<div class="stat-overlay">
							<h3>52</h3>
							<p class="visaschk">visa-free countries.</p>
						</div>
						
						
					</div>
					<div class="col-1-3">
						<p>Workflows in progress</p>
						<?php include_once("process-profile.php"); ?>
					</div>
					<div class="col-1-3">
						<h2>Upcoming Events</h2>
						<ul>
							<li>
								 August 12, 2017 8:30am<br/>
								 US - Consulate Visa appointment 
							</li>
							<li>
								 Sept 12, 2017 <br/>
								 H1B stamping expires
							</li>
						</ul>
						<p>&nbsp;</p>
						

						
						

					</div>
				</div>
			</div>

			<?php include_once("fragments/silos.php"); ?>

			
		</div>
		
	</body>

</html>
<script src="scripts/profile-behaviors.js"></script>

