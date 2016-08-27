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
    include_once("connect.php");
	$sql = "SELECT CountryName, CountryCode FROM CountryList";
	$result = $dbCon->query($sql);	
?>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
	</head>
	<body>
		<?php include_once("fragments/header.php"); ?>

		<div class="content">

			
			<div class="grid major-silos">
				<div class="col-1-1">
					<div class="destination-selector">
						<div class="select">
							<form action=<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?> method="post">
								<select name="country" id="country-select">
									<option>Where do you want to go?</option>
									<?php
							  			if ($result->num_rows > 0) {
							                // output data of each row
							                while($row = $result->fetch_assoc()) {
							                    echo "<option data-code='".$row["CountryCode"]."' >". $row["CountryName"]."</option>";
							                }
							            } else {
							                echo "0 results";
							            } 
							  		?>
							  	</select>
						  	</form>
						</div>

					</div>
					<div id="instructions">
						<?php include_once("fragments/free-visa-form.php"); ?>
						<div class="discovery rounded country-stats">
							<div class="stat-overlay">
								<h3>28</h3>
								<p class="visaschk">visa-free countries. See if you have more, answer a <a href="#">few simple questions</a> </p>
							</div>
							<div class="destination">
							  	<img src="images/world_map.svg" width="100%">
							</div>
						</div>
					</div>
				</div>
			</div>

			<?php if (!empty($_POST)): ?>
				<?php 
					$country = $_POST["country"];
					$countryId = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryListId FROM CountryList WHERE CountryName='$country'"));
					$visatype = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryVisaType FROM CountryVisaTypeList WHERE CountryVisaTypeDescription LIKE '%tourism%'"));
					$visaid = mysqli_fetch_row(mysqli_query($dbCon, "SELECT CountryVisaTypeListId FROM CountryVisaTypeList WHERE CountryVisaType='$visatype[0]'")); 
					$appnumber = "APP"."00".$userId.$countryId[0].$visatype[0];

					// Set session variables to create an application
					$_SESSION['appnumber']=$appnumber;
					$_SESSION['countryid']=$countryId[0];
					$_SESSION['visatype']=$visatype[0];
					$_SESSION['visaid']=$visaid[0];

					$app_exists = mysqli_fetch_row(mysqli_query($dbCon,"SELECT * FROM CustAppInfo WHERE CustAppNumber='$appnumber' AND Activated='1'"));
				?>
			    <p> Welcome!<br>
			    	The country you want to visit is <?php echo htmlspecialchars($_POST["country"]); ?>.<br>
			    	Your Application number is <?php echo $appnumber; ?>.<br>
			    	<?php if ($app_exists):?> 
			    		<p> Tou have already started an application!</p>
			    		<?php $_SESSION['appId']=$app_exists[0]; ?>
			    		<?php echo "Last updated: ".$app_exists[9]; ?>
			    		<script type="text/javascript">
				    		$(document).ajaxComplete(function(){
								$("#act").attr('value', 'Resume DS-160');
								$(".action .updated").text('<?php echo "Last updated: ".$app_exists[9]; ?>');
							});
						</script>
			    	<?php else: ?>
			    		<?php $_SESSION['newapp']=1; ?>
					<?php endif; ?>
			   	</p>
			   	<script type="text/javascript">
		    		$("#country-select").val('<?php echo $_POST["country"];?>');
		    		var code= $("#country-select option:selected").attr('data-code').toLowerCase();
			    	var url = "fragments/"+code+".php";
			    	$("#instructions").load(url);
			    </script>
			<?php else: ?>
				<p> You need to choose a country to vist!</p>  
			<?php endif; ?>		
		</div>

		


		<!--/// Behaviours -->
		<script type="text/javascript">
			$('#country-select').change(context);
			function context(){
				$(this).parents("form").submit();
			}

			$('.visaschk').click(function(){
			    $('.visaschk-form, .country-stats').toggleClass("hide");
			});

			$('.done').click(function(){
			    $('.visaschk-form, .country-stats').toggleClass("hide");
			});

			/// Count animation
			$('.count').each(function() {
				$(this).prop('Counter', 0).animate({
					Counter: $(this).text()
				}, {
					duration: 4000,
					easing: 'swing',
					step: function(now) {
						$(this).text(Math.ceil(now));
					}
				});
			});

		</script>

	</body>

</html>

<?php mysqli_close($dbCon); ?>

