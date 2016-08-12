
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="styles/main.css">
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800' rel='stylesheet' type='text/css'>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  </head>
  <body>

  <div class="content">

    <form method="post" action="acme.php"\>
      <select name="taskOption" id="country-select">
        <option value="first">First</option>
        <option value="second">Second</option>
        <option value="third">Third</option>
      </select>
    
      <div id="ajaxme">
        
      </div>

      
    </form>

    <script type="text/javascript">
        $('#country-select').change(context);

        function context(){

            $("#ajaxme").load('testt.php');
           
        }
    </script>


    <?php
       $option = isset($_POST['taskOption']) ? $_POST['taskOption'] : false;
       if ($option) {
          echo htmlentities($_POST['taskOption'], ENT_QUOTES, "UTF-8");
       } else {
         echo "task option is required";
         exit; 
       }
       ?>
</div>

</body>
</html>