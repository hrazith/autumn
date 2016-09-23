$(function() {
	var numItems = $('.form-intake').length;
	var i = 7;
	var queryString = "";


	$("#next").click(function(event) {
		if (i <= 8) {
			//$("#step" + i).addClass('hide');
			$("#step" + (i + 1)).removeClass('hide');
			percent = (i / numItems) * 100;

			console.log(percent);
			TweenMax.to(".progress .bar", 2, {
				width: percent + "%"
			});
			i++;
		}

		if (i > numItems) {
			processds();
			location.href = 'ds1.php';
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
		processds();
	});

	function processds() {
		queryString = $('form').serialize();
		$.post('processds1.php', queryString, function(data) {
			$('#status').html(data);
		});
	}

});