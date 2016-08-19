$(function() {
	var numItems = $('.form-intake').length;
	var i = 1;
	var queryString = "";


	$("#next").click(function(event) {

		if (i <= numItems) {
			queryString = $('form').serialize();

			$("#step" + i).addClass('hide');
			$("#step" + (i + 1)).removeClass('hide');
			percent = (i / numItems) * 100;
			TweenMax.to("#bar", 2, {
				width: percent + "%"
			});
			i++;

			alert(queryString);

		}

	});
	$("#back").click(function(event) {
		alert(numItems);
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