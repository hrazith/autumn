/*$(document).ready(function() {
	$("p").click(function() {
		$(this).hide();
	});
});*/

$(function() {

	TweenMax.to(".progress .bar", 2, {
		width: percentComplete + "%"
	});

});