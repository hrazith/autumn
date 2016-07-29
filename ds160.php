
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div class="content">
			<div class="login shadow">
				<h2>Names</h2>
				<form method ="post" action="index.php">
					<ul class="input-list">
						<li><input type="text" placeholder="Surnames" name="surname"/></li>
						<li><input type="text" placeholder="Given Name" name="givenname"/></li>
						<li><input type="text" placeholder="Native Name" name="givenname"/></li>
					</ul>
					<?php echo $err; ?>
					<div class="actions">
						<input type="submit" name="submit" class="primary rounded" value="Next"/>
							
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
