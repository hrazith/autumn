$(function() {
	$('.nom-header').click(function() {
		$(this).find('.icon-arrow-up').toggleClass('hide');
		$(this).find('.icon-arrow-down').toggleClass('hide')
		$(this).siblings('.noms').slideToggle();

	});

});