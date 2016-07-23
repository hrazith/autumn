<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div class="content">
			<div class="login shadow">
				<h2>Autumn</h2>
				<form method ="post" action="index.php">
					<ul class="input-list">
						<li><input type="text" placeholder="Email" name="email"/></li>
						<li><input type="password" placeholder="Password" name="password"/></li>
					</ul>
					<?php echo $err; ?>
					<div class="actions">
						<input type="submit" name="submit" class="primary rounded" value="Log In"/>
						<div class="links"> 
							<ul>
								<li><a>Sign up</a></li>
								<li><a>Forgot Pass?</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
