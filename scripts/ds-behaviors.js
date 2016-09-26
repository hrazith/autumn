$(function() {
	var numItems = $('.form-intake').length;
	var i = 1;
	var queryString = "";


	$(document).click(function() {
		console.log(i);
		if (i == 6) {
			$("#next").toggleClass('hide');
			$("#sav").toggleClass('hide');

		}
	});


	$("#start").click(function(event) {
		$(".intro, #step1 ").toggleClass('hide');
		$("#next").removeClass('disabled');
	});

	$("#next").click(function(event) {


		if (!$(this).hasClass("disabled")) {
			if (i <= numItems) {
				$("#step" + i).addClass('hide');
				$("#step" + (i + 1)).removeClass('hide');
				i++;
				calcpercent();
			}

			/*if (i > numItems) {
				processds();
				location.href = 'ds1.php';
			}*/
		}

		if (i > 1) {
			$("#back").removeClass('disabled');
		}


	});

	$("#back").click(function(event) {
		console.log(i);
		if (!$(this).hasClass("disabled")) {
			if (i > 1) {
				$("#step" + i).addClass('hide');
				$("#step" + (i - 1)).removeClass('hide');
				i--;
				calcpercent();
			}
			if (i == 1) {
				$(this).addClass('disabled');
			}
		}
		//$(".form-intake:not(.hide)").addClass('test');
	});

	$(".save").click(function(event) {
		event.preventDefault();
		processds();
	});

	function processds() {
		queryString = $('form').serialize();
		//data: $(this).serialize() + '&NonFormValue=' + NonFormValue,

		if (i <= 6) {
			queryString += '&index=' + i;
			$.post('processds.php', queryString, function(data) {
				$('#status').html(data);
			});
		}

		if (i >= 7) {
			$.post('processds1.php', queryString, function(data) {
				$('#status').html(data);
			});
		}

	}

	function calcpercent() {
		percent = (i / numItems) * 100;

		//console.log(percent);
		TweenMax.to(".progress .bar", 2, {
			width: percent + "%"
		});
	}

});