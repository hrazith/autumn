<html>
<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>

</head>
<body>
	<div class="content">
	
		<form>
	        <input name='appId' type='text' value='45'/><br/>
	        <input name='fname' type='text' value=''/><br/>
	        <input name='lname' type='text' value=''/><br/>
	        <input name='nname' type='text' value=''/><br/>


	       <!--  <input name='issueState' type='text' value=''/><br/>
	        <input name='issueDate' type='text' value=''/><br/>
	        <input name='expDate' type='text' value=''/><br/> -->
		</form>
		<br/>
		<button id="save" class="primary rounded"> Click</button>
		<br/><br/>
		<hr/>
		<br/><br/>
		<div id="status">
		</div>
	</div>






<script type="text/javascript">
	$("#save").click(function(event) {
		var queryString = $('form').serialize();

		$.post('ser.php', queryString, function(data) {
			$('#status').html(data);
		});

	});
	
</script>


</html>

