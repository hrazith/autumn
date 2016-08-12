<?php

    include_once("connect.php");
	$sql = "SELECT CountryName, CountryCode FROM CountryList";
	$result = $dbCon->query($sql);	
?>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="styles/main.css">
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
		<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="scripts/jquery.typeahead.js"></script>
	</head>
	<body>
		<header> 
			<div class="logo"> Autumn</div>
			<div class="global-nav">
				<form method ="post" action="logout.php">
				<ul>
					<li class="date"> June 13, 2015</li>
					<li class="date"> <?php echo $email; ?></li>
					<li> <a><i class="icon-settings"></i>Settings</a></li>
					<li> <input type="submit" name="submit" class="naked" value="Log Out"/></li>
				</ul>
				</form>
			</div>
		</header>
		<div class="hero">	
			&nbsp;
		</div>
		<div class="content">


		<div class="js-result-container"></div>

    <form>
        <div class="typeahead__container">
            <div class="typeahead__field">

            <span class="typeahead__query">
                <input class="js-typeahead-input"
                       name="q"
                       type="search"
                       autofocus
                       autocomplete="off">
            </span>
            <span class="typeahead__button">
                <button type="submit">
                    <span class="typeahead__search-icon"></span>
                </button>
            </span>

            </div>
        </div>
    </form>

    <script>

        var data = {
            countries: [
                <?php 
                    if ($result->num_rows > 0) {
                        while($countryrow = $result->fetch_assoc()) {
                        echo '"', htmlspecialchars($countryrow['CountryName'], ENT_QUOTES, 'UTF-8'), '",';  }
                        } else { echo "";} 
                ?>
            ],
            codes: [
                <?php 
                    if ($result->num_rows > 0) {
                        while($coderow = $result->fetch_assoc()) {
                        echo '"', htmlspecialchars($coderow['CountryCode'], ENT_QUOTES, 'UTF-8'), '",';  }
                        } else { echo "";} 
                ?>
            ]
        };

        typeof $.typeahead === 'function' && $.typeahead({
            input: ".js-typeahead-input",
            minLength: 1,
            order: "asc",
            group: false,
            maxItemPerGroup: 4,
            groupOrder: function () {

                var scope = this,
                    sortGroup = [];

                for (var i in this.result) {
                    sortGroup.push({
                        group: i,
                        length: this.result[i].length
                    });
                }

                sortGroup.sort(
                    scope.helper.sort(
                        ["length"],
                        false, // false = desc, the most results on top
                        function (a) {
                            return a.toString().toUpperCase()
                        }
                    )
                );

                return $.map(sortGroup, function (val, i) {
                    return val.group
                });
            },
            hint: true,
            dropdownFilter: false,
            href: "https://en.wikipedia.org/?title={{display}}",
            template: "{{display}}, <small><em>{{group}}</em></small>",
            emptyTemplate: "no result for {{query}}",
            source: {
                country: {
                    data: data.countries
                },
                code: {
                    data: data.codes
                }
            },
            callback: {
                onClickAfter: function (node, a, item, event) {
                    event.preventDefault();
                        

                    //$("#instructions").load("ustest.php #p1");
                    alert(item.display);

                    $('.js-result-container').text('');

                },
                onResult: function (node, query, obj, objCount) {

                    console.log(objCount)

                    var text = "";
                    if (query !== "") {
                        text = objCount + ' elements matching "' + query + '"';
                    }
                    $('.js-result-container').text(text);

                }
            },
            debug: true
        });

    </script>


			
			<div class="grid major-silos">
				<div class="col-1-1">
					<div class="destination-selector">
						<div class="select">
							<select name="countries" id="country-select">
								<option>Where do you want to go?</option>
								<?php
						  			if ($result->num_rows > 0) {
						                // output data of each row
						                while($row = $result->fetch_assoc()) {
						                    echo "<option data-code='".us."' >". $row["CountryName"]."</option>";
						                }
						            } else {
						                echo "0 results";
						            } 
						  		?>
						  	</select>
						</div>
					</div>
					<div id="instructions">
						<div class="discovery rounded">
							<div class="stat-overlay">
								<h3>28</h3>
								<p>visa-free countries. See if you have more, answer a <a href="#">few simple questions</a> </p>
							</div>
							<div class="destination">
							  	<img src="images/world_map.svg" width="100%">
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>



		<script type="text/javascript">
		    $('#country-select').change(testMessage);

		    function testMessage(){
		        $("#instructions").load("ustest.php #p1");
		    }
		</script>
		

		<script type="text/javascript">
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

			acronym = acronym.toLowerCase() + ".php";
			//alert(context2);

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

			//alert(acronym);

			}
		</script>


	<script src="scripts/main.js"></script>	
	</body>

</html>

<?php mysqli_close($dbCon); ?>

