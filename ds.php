<?php
	session_start();
	$_SESSION['id']= 8;
	$_SESSION['countryid']= 224;
	$_SESSION['visaid']= 2;
	$_SESSION['appnumber']='APP008224B-2';

	
    include_once("connect.php");
    
	mysqli_close($dbCon);
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
					<li> <a href="#">Save</a></li>
					<li> 
						Close
					</li>
					
				</ul>
				</form>
			</div>
		</header>
		<div class="content-intake">
			<div class="intake-inner">
				<div class="intro">
					<h2 data-localize="greeting"> DS-160</h2>
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
				<input type="submit" name="submit" class="primary rounded" value="Done" id="next"/>
			</div>		
		</div>
		
		<?php if (!empty($_POST)): ?>
				
			    
    		<p>Your email is <?php echo htmlspecialchars($_POST["email"]); ?>.</p>
    	
    	<?php else: ?>
    		<p>Nothing yet</p>
			  
		<?php endif; ?>

		<script src="scripts/behaviors.js"></script>
	</body>
</html>