
<!doctype html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div class="content">
			<div class="intro">
				<h2 data-localize="greeting"> DS-160</h2>
				<div id="progress">
  					<div id="bar"></div>
				</div>
			</div>
			<div class="inputbox ds160-intake shadow">
				<form method ="post" action="ds160-2.php">
					<div class="grid">
						<div class="col-1-2">
							<h2>Gender</h2>
							<ul class="input-list gender">
								<li><input type="radio" name="gender" value="male"> Male</li>
								<li><input type="radio" name="gender" value="female"> Female</li>
							</ul>
						</div>
						<div class="col-1-2">
							<h2>Marital Status</h2>
							<ul class="input-list mstatus">
								<li><input type="radio" name="mstatus" value="married"> Married</li>
								<li><input type="radio" name="mstatus" value="single"> Single</li>
								<li><input type="radio" name="mstatus" value="single"> Divorced</li>
								<li><input type="radio" name="mstatus" value="single"> Widowed</li>
								<li><input type="radio" name="mstatus" value="single"> Legally seperated</li>
							</ul>
						</div>
					</div>
					<?php echo $err; ?>
					<div class="actions">
						<input type="submit" name="submit" class="primary rounded" value="Next"/>		
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
<br>
  <br>