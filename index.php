<!-- ANOIXE TO : http://localhost/insert-data/index.php-->
<?php

require 'config.php';
if(!empty($_SESSION["id_user"])){
    $id = $_SESSION["id_user"];
    $result = mysqli_query($conn, "SELECT * FROM user WHERE id_user = $id");
    $row = mysqli_fetch_assoc($result);
}
else{
    header("Location: login.php");
    
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Local Markets</title>
      <!-- To menu-->
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
      <link rel="stylesheet" href="2ND.css" />
      <!--XARTHS-->
      <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin=""/>
      <!--LEAFLET XARTH-->
      <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js" integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
     
      <!--VIVLIOTHIKI  GIA SEARCH BAR-->

      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/leaflet-search@3.0.2/dist/leaflet-search.min.css" />
      <!--<script src="https://unpkg.com/leaflet@1.3.0/dist/leaflet.js"></script>-->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-search/3.0.2/leaflet-search.min.js"></script>
    </head>
<body>
   
    

<header>
      <a href="#" class="logo">Find<span>Products.</span></a>
      <ul>
        <li><a href="logout.php" id="home-button">Αποχώρηση</a></li>
        <li><a href="#">About<i class="fas fa-caret-down"></i></a>
          <div class="dropdown-panel">
              <ul>
                <li><a href="#">Pricing</a></li>
                <li><a href="#"> υποβληθη προσφορές</a></li>
                <li>
                  <a href="#">Ιστορικο like/dislike <i class="fas fa-caret-right"></i></a>
                  
                  <div class="dropdown-panel">
                    <ul>
                      <li><a href="#">Team-1</a></li>
                      <li><a href="#">Team-2</a></li>
                      <li><a href="#">Team-3</a></li>
                      <li><a href="#">Team-4</a></li>
                    </ul>
                  </div>
                </li>
                <li><a href="#">FAQ</a></li>
              </ul>
            </div>
        <li><a href="#">Tokens<i class="fas fa-caret-down"></i></a>
          <div class="dropdown-panel">
              <ul>
                <li><a href="#">Pricing</a></li>
              </ul>
            </div>
        <li><a href="#">Portfolio</a></li>
        <li><a href="#">Team<i class="fas fa-caret-down"></i></a>
          <div class="dropdown-panel">
              <ul>
                <li><a href="#">Pricing</a></li>
                <li><a href="#">Portfolio</a></li>
                
                <li><a href="#">FAQ</a></li>
              </ul>
            </div>
            <li>
              <a href="#" id="contact-button" onclick="toggleOptions()">Options <i class="fas fa-caret-down"></i></a>
              <div class="dropdown-panel" id="options-panel" style="display: none;">
                <ul>
                  <li><a href="#" onclick="showChangeUsernameForm()">Change Username</a></li>
                  <li><a href="#" onclick="showChangePasswordForm()">Change Password</a></li>
                </ul>
              </div>
            </li>
          
      </ul>
    </header>

    <!-- GIA ALLAGH PASSWORD , USERNAME-->
    <div id="change-username-form" class="hidden-form">
      <h1>Change Username</h1>
      <form onsubmit="return saveUsername()">
        <label for="new-username">New Username:</label><br>
        <input type="text" id="new-username" name="new-username"><br>
        <input type="submit" value="Save">
      </form>
    </div>
    
    <div id="change-password-form" class="hidden-form">
      <h1>Change Password</h1>
      <form onsubmit="return savePassword()">
        <label for="new-password">New Password:</label><br>
        <input type="password" id="new-password" name="new-password"><br>
        <input type="submit" value="Save">
      </form>
    </div>
    

<!-- TELOS FORMWN GIA ALLAGES-->


    <!-- tO EFFECT TOU BANNER-->
  <script type="text/javascript">
    window.addEventListener("scroll", function(){
    var header = document.querySelector("header");
  header.classList.toggle("sticky",window.scrollY > 0);
  })
  </script> 






<!-- SUNEXISI-->

<div class="panel" id="user-info" >
  <h1>Πληροφορίες χρήστη</h1>
  <!-- panel for displaying user information -->
  <p>όνομα: <?php echo $row["username"]; ?></p>
  <p>Τοποθεσία: <p id="city"></p><p id="location"></p></p>
</div>


<section class="banner"></section>
<div id="map" >

</div>

<!-- FOOTER TESTING -->

<footer class="footer" id="footer">
  <div class="container">
    <div class="row">
      <div class="footer-col">
        <h4>company</h4>
        <ul>
          <li><a href="#">about us</a></li>
          <li><a href="#">our services</a></li>
          <li><a href="#">privacy policy</a></li>
          <li><a href="#">affiliate program</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h4>get help</h4>
        <ul>
          <li><a href="#">TEST</a></li>
         
        </ul>
      </div>
    
      <div class="footer-col">
        <h4>Contact us</h4>
        <div class="social-links" >
<!--          <a href="#"><i class="fab fa-facebook-f"></i></a>  -->
          <a href="#" ><i class="fab fa-google"></i></a>
          

            
          
        </div>
      </div>
    </div>
  </div>
</footer>




<!--<script src="DEUTEROJSCRIPTAKIA.js"></script>--> <!-- KAKO LAT KLP , KAKO API CALL OVERPASS-->
<!-- TEST GIA SCRPIT-->
<script src="2ND JAVASCRIPT.js"></script>
<!--<script src="SCRIPT TEST2.js"></script>--> <!-- KAMIA TOPOTHESIA XRISTI , KANENA MARKER-->


</body>
</html>



