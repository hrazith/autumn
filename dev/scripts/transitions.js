$(function() {
	var numItems = $('.form-intake').length;
	var completed = 1;
	percent = (completed / numItems) * 100;
	//alert(percent);
	TweenMax.to("#bar", 2, {
		width: "80%"
	});



});