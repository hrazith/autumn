$(function() {
	var numItems = $('.form-intake').length;
	var i = 1;
	var queryString = "";

	$("#start").click(function(event) {
		$(".intro, #step1 ").toggleClass('hide');
	});

	$("#next").click(function(event) {
		if (i <= numItems) {
			$("#step" + i).addClass('hide');
			$("#step" + (i + 1)).removeClass('hide');
			percent = (i / numItems) * 100;
			TweenMax.to("#bar", 2, {
				width: percent + "%"
			});
			i++;
		}
	});

	$(".save").click(function(event) {
		queryString = $('form').serialize();
		//alert(queryString);
		$.post('processds.php', queryString, function(data) {
			$('#result').html(data);
		});
	});



});

//http://stackoverflow.com/questions/607673/setting-a-php-sessionvar-using-jquery

/*TweenMax.to("#bar", 2, {
	width: percent + "%",
	onComplete: endFrame
});

function endFrame() {
	alert("Hello");
	$('#step1 form').submit();*/