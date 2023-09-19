<?php

require 'config.php';
if(!empty($_SESSION["id_user"])){
    header("Location: index.php");
}
if(isset($_POST["submit"])){
   $usernameemail = $_POST["usernameemail"];
   $password =$_POST["password"];
   $result = mysqli_query($conn, "SELECT * FROM user WHERE username='$usernameemail' OR email='$usernameemail'");
   $row = mysqli_fetch_assoc($result);
   if(mysqli_num_rows($result) > 0){
     if($password == $row["password"]){
        $_SESSION["login"] = true;
        $_SESSION["id_user"] = $row["id_user"];
        header("Location: index.php");
        
     }
     else{
        echo
        "<script> alert('Wrong password');</script>";
     }

   
   }
   else {
       echo
    "<script> alert('User not registered');</script>";
   }
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <title>Main Window</title>
    <link rel="stylesheet" href="styl 1hs.css" />
</head>
<body>
<section >
    <h1 >ΚΑΛΩΣ ΗΡΘΑΤΕ ΣΤΗΝ ΣΥΝΕΡΓΑΤΙΚΗ ΜΑΣ ΠΛΑΤΦΟΡΜΑ!</h1>
    <h2 > ΜΠΟΡΕΙΤΕ ΝΑ ΣΥΝΔΕΘΕΙΤΕ!</h2>
     
    </section>
    <form id="form" class="" action="" method="post" autocomplete="off">
        <label for="usernameemail"> Username or Email :</label>
        <input type="text" name="usernameemail" id ="usernameemail" required value=""><br>
        <label for="password"> Password :</label>
        <input type="password" name="password" id ="password" required value=""><br>
        <button type="submit" name="submit">Login</button>
    </form>
    <br>
    <a href="registration.php">Registration</a>
    <p><small>Copyright &copy; Omada web 2022-23</small></p>
  

  <script src="1ST JAVASCRIPT.js"></script>      
</body>
</html>