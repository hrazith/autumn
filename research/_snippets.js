var CurrentPageURL = $(location).attr("href");

TweenMax.to("#bar", 2, {
	width: percent + "%",
	onComplete: endFrame
});



// http://stackoverflow.com/questions/607673/setting-a-php-sessionvar-using-jquery



function endFrame() {
	alert("Hello");
	$('#step1 form').submit();