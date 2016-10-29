<?php
	error_reporting(E_ALL & ~E_NOTICE);
	session_start();
	unset($_SESSION['id']);
	unset($_SESSION['email']);
	session_unset(); 
	session_destroy();
	header("location:index.php");
?>

