(function() {


	function showContext(context) {

		var words, acronym, nextWord;
		words = context.split(' ');
		acronym = "";
		index = 0

		while (index < words.length) {
			nextWord = words[index];
			acronym = acronym + nextWord.charAt(0);
			index = index + 1;
		}

		acronym = acronym.toLowerCase() + "a.html"

		var xhttp;
		if (context == "") {
			document.getElementById("instructions").innerHTML = "";
			return;
		}
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("instructions").innerHTML = xhttp.responseText;
			}
		};
		xhttp.open("GET", acronym, true);
		xhttp.send();

		alert(acronym);
	}


})();