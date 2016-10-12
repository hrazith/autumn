jQuery(document).ready(function($) {

	function QuestionnaireBuilder(element) {
		this.element = element;

		this.mainNavigation = this.element.find('.qStepper');
		this.save = this.element.find('.save');
		this.start = this.element.find('.init');

		this.currentStep = this.element.find('.qStep').first();
		this.nextStep = function() {
			return this.currentStep.next();
		}
		this.prevStep = function() {
			return this.currentStep.prev();
		}

		this.allSteps = this.element.find('.qStep');
		this.totalSteps = this.allSteps.length;

		this.loaded = true;

		// bind builder events
		this.bindEvents();
	}

	QuestionnaireBuilder.prototype.bindEvents = function() {
		var self = this;

		this.mainNavigation.on('click', 'li:not(.disabled)', function(event) {
			event.preventDefault();

			if ($(this).hasClass('next')) {
				//disable previous button at the begining
				if (self.currentStep.index() == 1) {
					$(this).siblings().removeClass('disabled');
				}
				//disable next button at the end
				if (self.currentStep.index() == self.totalSteps - 1) {
					$(this).addClass('disabled');
				}
				//Move to next step
				self.moveTo(self.nextStep());

			}

			if ($(this).hasClass('prev')) {
				//disable previous button when u back up to the 1st step
				if (self.currentStep.index() == 2) {
					$(this).addClass('disabled');
				}
				//enable previous button when at the last step
				if (self.currentStep.index() == self.totalSteps) {
					$(this).siblings().removeClass('disabled');
				}
				//Move to previous step
				self.moveTo(self.prevStep());
			}

		});

		this.save.on('click', function(event) {
			event.preventDefault();
			self.saveQuestionnaire();
		});

		this.start.on('click', function(event) {
			self.mainNavigation.removeClass('hide');
			$(this).parent().addClass('hide');
			self.currentStep.removeClass('hide');
		});

	}

	QuestionnaireBuilder.prototype.saveQuestionnaire = function() {
		console.log(this.nextStep);
		queryString = $('form').serialize();
		$.post('processds.php', queryString, function(data) {
			$('#status').html(data);
		});
	}

	QuestionnaireBuilder.prototype.moveTo = function(direction) {
		this.currentStep.toggleClass('hide');
		direction.toggleClass('hide');
		this.currentStep = direction;
	}


	if ($('.qBuilder').length > 0) {
		$('.qBuilder').each(function() {
			//create a QuestionnaireBuilder object for each .qBuilder (Div)
			new QuestionnaireBuilder($(this));
		});
	}



});