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
	</head>
	<body>
		<header> 
			<div class="logo"> Autumn</div>
			<div class="global-nav">
				<form method ="post" action="logout.php">
				<ul>
					<li class="date"> June 13, 2015</li>
					<li class="date"> <?php echo $_SESSION['username'] ?></li>
					<li> 
						<select>
							<option class="firstOpt" value="en">English</option>
					        <option value="tn">Tamil</option>
					        <option>Pulp Fiction</option>
					        <option>Kannada</option>
					        <option>12 Angry Men</option>
						</select>
					</li>
					<li> <input type="submit" name="submit" class="naked" value="Log Out"/></li>
				</ul>
				</form>
			</div>
		</header>
		<div class="hero">	
			&nbsp;
		</div>
		<div class="content">
			<div class="grid">
				<div class="discovery rounded country-stats">
					<p>
						DS-160 application:<br/>
						Percentage complete:  is 30% complete<br/>
						App ID:  <?php echo $_SESSION['appId']; ?><br/>
						Application number: <?php echo $_SESSION['appnumber']; ?>
					</p>
			    	<?php 
			    		echo '<pre>';
							var_dump($_SESSION);
						echo '</pre>';
					?>
			    	

				</div>
			</div>
			<div class="grid major-silos">
				<div class="col-1-4">
					<a href="where.php">
						<div class="silo rounded">
							<i class="icon-nominations"></i>
							<h2>Visit</h2>
						</div>
					</a>
				</div>
				<div class="col-1-4">
					<div class="silo rounded">
						<i class="icon-contracts"></i>
						<h2>Work</h2>
					</div>
				</div>
				<div class="col-1-4">
					<div class="silo rounded">
						<i class="icon-volume"></i>
						<h2>Study</h2>
					</div>
				</div>
				<div class="col-1-4">
					<div class="silo rounded">
						<i class="icon-tickets"></i>
						<h2>Join family</h2>
					</div>
				</div>
			</div>
			<div class="grid major-silos">
				<div class="col-1-4">
					<div class="silo rounded">
						<i class="icon-statements"></i>
						<h2>Start Business</h2>
					</div>
				</div>
				<div class="col-1-4">
					<div class="silo rounded">
						<i class="icon-invoices"></i>
						<h2>Invest</h2>
					</div>
				</div>
				<div class="col-1-4">
					<div class="silo rounded">
						<i class="icon-letter"></i>
						<h2>Live permanently</h2>
					</div>
				</div>
				<div class="col-1-4">
					<div class="silo rounded">
						<i class="icon-marquee"></i>
						<h2>--</h2>
					</div>
				</div>
			</div>
		</div>
		
	</body>

</html>