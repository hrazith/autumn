jQuery(document).ready(function($) {

	function ProductBuilder(element) {
		this.element = element;

		//console.log(element);

		this.mainNavigation = this.element.find('.qStepper');
		this.allSteps = this.element.find('.qStep');
		this.totalSteps = this.allSteps.length;

		this.loaded = true;

		// bind builder events
		this.bindEvents();
	}

	ProductBuilder.prototype.bindEvents = function() {
		var self = this;


		this.mainNavigation.on('click', 'li:not(.disabled)', function(event) {
			event.preventDefault();
			self.currentStep = self.element.find('.qStep:not(.hide)');
			self.nextStep = self.currentStep.next();
			self.prevStep = self.currentStep.prev();


			if ($(this).hasClass('next')) {
				if (self.currentStep.index() == 0) {
					$(this).siblings().removeClass('disabled');
				}
				if (self.currentStep.index() == self.totalSteps - 2) {
					$(this).addClass('disabled');
				}
				self.currentStep.toggleClass('hide');
				self.nextStep.toggleClass('hide');
			}

			if ($(this).hasClass('prev')) {
				if (self.currentStep.index() == 1) {
					$(this).addClass('disabled');
				}
				if (self.currentStep.index() == self.totalSteps - 1) {
					$(this).siblings().removeClass('disabled');
				}
				self.currentStep.toggleClass('hide');
				self.prevStep.toggleClass('hide');
			}

			//self.loaded && self.newContentSelected($(this).index());
		});

	};


	if ($('.qBuilder').length > 0) {
		$('.qBuilder').each(function() {
			//create a productBuilder object for each .cd-product-builder
			new ProductBuilder($(this));
		});
	}



});