<?php
	error_reporting(E_ALL & ~E_NOTICE);
	session_start();

	if ($_POST['submit']) {
		include_once("connect.php");
		$email = strip_tags($_POST['email']);
		$password = strip_tags($_POST['password']);


	    $sql = "SELECT CustProfileInfoId, EmailAddress, Password FROM CustProfileInfo WHERE EmailAddress = '$email' AND Activated = '1' LIMIT 1";

	    $query = mysqli_query($dbCon, $sql);

	    if ($query) {
	    	$row = mysqli_fetch_row($query);
	    	$userId = $row[0];
	    	$dbEmail = $row[1];
	    	$dbPassword = $row[2];
	    }

	    if ($email == $dbEmail && $password == $dbPassword) {
	    	$_SESSION['email'] = $email;
	    	$_SESSION['id'] = $userId;
	    	header('Location:home.php');
	    } else { 
			echo "Incorrect username or password";
	    }
	}
?>	

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
