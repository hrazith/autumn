$(function() {
	var numItems = $('.form-intake').length;
	var i = 1;
	var queryString = "";

	$("#start").click(function(event) {
		$(".intro, #step1 ").toggleClass('hide');
		$("#next").removeClass('disabled');
	});

	$("#next").click(function(event) {


		if (!$(this).hasClass("disabled")) {
			if (i <= numItems) {
				$("#step" + i).addClass('hide');
				$("#step" + (i + 1)).removeClass('hide');
				percent = (i / numItems) * 100;

				//console.log(percent);
				TweenMax.to(".progress .bar", 2, {
					width: percent + "%"
				});
				i++;
			}

			if (i > numItems) {
				processds();
				location.href = 'ds1.php';
			}
		}

		if (i > 1) {
			$("#back").removeClass('disabled');
		}
		console.log(i);

	});

	$("#back").click(function(event) {
		console.log(i);
		if (!$(this).hasClass("disabled")) {
			if (i > 1) {
				$("#step" + i).addClass('hide');
				$("#step" + (i - 1)).removeClass('hide');
				i--;
			}
			if (i == 1) {
				$(this).addClass('disabled');
			}
		}
		//$(".form-intake:not(.hide)").addClass('test');
	});

	$(".save").click(function(event) {
		processds();
	});

	function processds() {
		queryString = $('form').serialize();
		$.post('processds.php', queryString, function(data) {
			$('#status').html(data);
		});
	}

});

//http://stackoverflow.com/questions/607673/setting-a-php-sessionvar-using-jquery

/*TweenMax.to("#bar", 2, {
	width: percent + "%",
	onComplete: endFrame
});

function endFrame() {
	alert("Hello");
	$('#step1 form').submit();*/