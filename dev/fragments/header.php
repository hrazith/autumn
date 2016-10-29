<header> 
	<div class="logo"> Autumn</div>
	<div class="global-nav">
		<form method ="post" action="logout.php">
		<ul>
			<li class="date"> June 13, 2015</li>
			<li class="date"> <a href="profile.php"><?php echo $_SESSION['username'] ?></a></li>
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
		