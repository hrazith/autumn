<?php
	error_reporting(E_ALL & ~E_NOTICE);
	session_start();
	/*unset($_SESSION['id']);*/
	session_destroy();
?>

<p> You are logged out</p>