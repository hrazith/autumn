<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){

	$("#reg").click(function(){
		
		var send = $('form').serialize();
		$("#serial").text(send);
		$.post('serialize.php', send, function(data){
    		$('#result').html(data);
 		});


	});

});
</script>
</head>
<body>

<form>
  First name: <input type="text" name="FirstName" value="Mickey"><br>
  Last name: <input type="text" name="LastName" value="Mouse"><br>
</form>

<button id="reg">Submit</button>


<div id="serial"></div>
<div id="result"></div>

</body>
</html>