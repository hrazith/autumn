(function() {

	var app = angular.module('nomsList', []);
	app.controller('nomsController', function() {
		this.items = noms;
	});

	< ul >
		< li ng - repeat = "(key,noms) in data" >
		< h1 > {
			{
				key
			}
		} < /h1>	 < ul >
		< li ng - repeat = "row in noms" > {
			{
				row.id
			}
		} < /li> < /ul> < /li> < /ul>

	var data = {
		"Jan2005": [{
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
		}],
		"Feb2005": [{
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
		}],
	};

	< ul >
		< li ng - repeat = "row in noms" > {
			{
				row.id
			}
		} < /li> < /ul>

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