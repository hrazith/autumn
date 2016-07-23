(function() {

	var app = angular.module('nomsList', []);
	app.controller('nomsController', function() {
		this.items = noms;
	});

	var months = [{
		"name": "Jan",
		"noms": [{
			"id": "NR20142003V01",
			"type": "LT SWT"
		}, {
			"id": "NR20142003V01",
			"type": "LT SWT"
		}, {
			"id": "NR20142003V01",
			"type": "LT SWT"
		}]
	}, {
		"name": "Feb",
		"noms": [{
			"id": "NR20142003V01",
			"type": "LT SWT"
		}, {
			"id": "NR20142003V01",
			"type": "LT SWT"
		}, {
			"id": "NR20142003V01",
			"type": "LT SWT"
		}]
	}, {
		"name": "Mar",
		"noms": [{
			"id": "NR20142003V01",
			"type": "LT SWT"
		}, {
			"id": "NR20142003V01",
			"type": "LT SWT"
		}, {
			"id": "NR20142003V01",
			"type": "LT SWT"
		}]
	}];

	var noms = [{
		id: 'NR20142003V01',
		type: 'LT SWT',
		status: 'Denied',
		area: 'Alexander Station',
		contactPoint: 'Dore - Musket Rail',
		origNomType: 'Standard',
		connectionPoint: 'Dore - Musket Rail',
		destNomType: 'Standard',
		account: '--',
		origNomType: 'Standard',
		volume: '1,000'
	}, {
		id: 'NR20142003V02',
		type: 'LI SWF',
		status: 'Denied',
		area: 'Ice Station Zebra',
		contactPoint: 'Indore - Mysore Rail',
		origNomType: 'Standard',
		connectionPoint: 'Dore - Musket Rail',
		destNomType: 'Standard',
		account: '--',
		origNomType: 'Standard',
		volume: '24,330'
	}, {
		id: 'NR20142003V03',
		type: 'FT SWF',
		status: 'Denied',
		area: 'King Shejon Station',
		contactPoint: 'Minsk Square',
		origNomType: 'Premier',
		connectionPoint: 'Dore - Musket Rail',
		destNomType: 'Standard',
		account: '--',
		origNomType: 'Standard',
		volume: '23,000'
	}, {
		id: 'NR20142003V04',
		type: 'FT SWF',
		status: 'Denied',
		area: 'King Shejon Station',
		contactPoint: 'Minsk Square',
		origNomType: 'Premier',
		connectionPoint: 'Dore - Musket Rail',
		destNomType: 'Standard',
		account: '--',
		origNomType: 'Standard',
		volume: '23,000'
	}]

})();