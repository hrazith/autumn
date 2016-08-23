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
					<li> <a class="save" href="where.php">Close</a></li>
				</ul>
				</form>
			</div>
		</header>
		<div class="content-intake">
			<div class="intake-inner"> 
				<div class="intro">
					<h1 data-localize="greeting"> DS-160</h1>
					<?php if ($_SESSION['newapp']==1):?> 
						<p>Online Nonimmigrant Visa Application form, is for temporary travel to the United States, and for K (fiancé(e)) visas. Form DS-160 is submitted electronically to the Department of State website via the Internet. Consular Officers use the information entered on the DS-160 to process the visa application and, combined with a personal interview, determine an applicant’s eligibility for a nonimmigrant visa.
						</p>
						<input type="submit" name="submit" class="primary rounded" value="Start" id="start"/>
					<?php else: ?>
						<p>You have an app already<?php echo $_SESSION['id'].$_SESSION['appId'] ?>  </p>
						<input type="submit" name="submit" class="primary rounded" value="Start" id="start"/>
						<?php
							include_once("connect.php");
							$columns =  mysqli_query($dbCon,"SHOW COLUMNS FROM CustPersonalInfo"); 
							$result2 = mysqli_fetch_row(mysqli_query($dbCon,"SELECT * FROM CustPersonalInfo WHERE CustAppInfoId = '{$_SESSION['appId']}'"));
							$i=0;
							while($row = mysqli_fetch_array($columns)){
								$cust[$row['Field']] = $result2[$i];	
								$i++;
							}
							mysqli_close($dbCon);
						?>
					<?php endif; ?>
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