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

	$("#back").click(function(event) {
		if (i > 1) {
			$("#step" + i).addClass('hide');
			$("#step" + (i - 1)).removeClass('hide');
			i--;
		}

		//$(".form-intake:not(.hide)").addClass('test');

	});

	$(".save").click(function(event) {
		queryString = $('form').serialize();
		//alert(queryString);
		$.post('processds.php', queryString, function(data) {
			$('#status').html(data);
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