<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <!-- Place favicon.ico in the root directory -->

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <h1>Sign up</h1>
        <form action="signin.php" method="post">
            <p>
                <label for="username">User Name:</label>
                <input type="text" name="username" id="userName">
            </p>
            <p>
                <label for="firstname">First Name:</label>
                <input type="text" name="firstname" id="firstName">
            </p>
            <p>
                <label for="lastname">Last Name:</label>
                <input type="text" name="lastname" id="lastName">
            </p>
            <p>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email">
            </p>
            <p>
                <label for="password">Password:</label>
                <input type="password" name="password" id="pass">
            </p>
            <p>
                <label for="dob">Date of Birth:</label>
                <input type="text" name="dob" id="dob">
            </p>

            <p> By signing up, I agree to Autumn’s Terms of Service, Payments Terms of Service, Privacy Policy, Refund Policy, and Customer Guarantee Terms.</p>
            
            
            <input type="submit" value="Submit">
        </form>
        

        
       

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.12.0.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='https://www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>
    </body>
</html>
