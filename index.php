<?php
	error_reporting(E_ALL & ~E_NOTICE);
	session_start();

	if ($_POST['submit']) {
		include_once("connect.php");
		$email = strip_tags($_POST['email']);
		$password = strip_tags($_POST['password']);


	    $sql = "SELECT CustProfileInfoId, UserName, EmailAddress, Password FROM custprofileinfo WHERE EmailAddress = '$email' AND Activated = '1' LIMIT 1";

	    $query = mysqli_query($dbCon, $sql);

	    if ($query) {
	    	$row = mysqli_fetch_row($query);
	    	$userId = $row[0];
	    	$username = $row[1];
	    	$dbEmail = $row[2];
	    	$dbPassword = $row[3];
	    }

	    if ($email == $dbEmail && $password == $dbPassword) {
	    	$_SESSION['email'] = $email;
	    	$_SESSION['id'] = $userId;
	    	$_SESSION['username'] = $username;
	    	header('Location: profile.php');
	    } else { 
			/*$err= "Incorrect email or password";*/
			$err = '<i class="icon-arrow-up"></i>'.'Incorrect email or password';
	    }
	}
?>	
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<div class="content">
			<div class="inputbox signin shadow">
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
								<li><a href="signup.php">Sign up</a></li>
								<li><a>Forgot Pass?</a></li>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
