<?php
require 'config.php';
if(!empty($_SESSION["id_user"])){
    header("Location: index.php");
}
if(isset($_POST["submit"])){
   $name = $_POST["name"];
   $email = $_POST["email"];
   $password =$_POST["password"];
   
    // Password requirements
    $uppercase = preg_match('/[A-Z]/', $password);
    $number = preg_match('/\d/', $password);
    $symbol = preg_match('/[!@#$%^&*]/', $password);

    if (strlen($password) < 8 || !$uppercase || !$number || !$symbol) {
        echo "<script> alert('Ο ΚΩΔΙΚΟΣ ΣΑΣ ΠΡΕΠΕΙ ΝΑ ΕΧΕΙ ΤΟΥΛΑΧΙΣΤΟΝ 8 ΧΑΡΑΚΤΗΡΕΣ, ΕΝΑ ΚΕΦΑΛΑΙΟ ΓΡΑΜΜΑ, ΕΝΑΝ ΑΡΙΘΜΟ, ΚΑΙ ΕΝΑ ΣΥΜΒΟΛΟ ΠΧ(!@#$%^&*)'); </script>";
    } else {
        $duplicate = mysqli_query($conn, "SELECT * FROM user WHERE username='$name' OR email='$email'");
        if (mysqli_num_rows($duplicate) > 0) {
            echo "<script> alert('ΟΝΟΜΑ Η EMAIL ΥΠΑΡΧΕΙ ΗΔΗ ΠΑΡΑΚΑΛΩ ΤΟΠΟΘΕΤΕΙΣΤΕ ΔΙΑΦΟΡΕΤΙΚΟ'); </script>";
        } else {
            $query = "INSERT INTO user VALUES('', '$name', '$password' ,'$email','' ,'','','')";
            mysqli_query($conn, $query);
            echo "<script> alert('ΕΠΙΤΥΧΗΣ ΕΓΓΡΑΦΗ!'); </script>";
        }
    }
}
?>



<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8" >
   
    <title>Registration</title>
    <link rel="stylesheet" href="styl 1hs.css" />
</head>
<body>
<section >
    <h1 >ΚΑΛΩΣ ΗΡΘΑΤΕ ΣΤΗΝ ΣΥΝΕΡΓΑΤΙΚΗ ΜΑΣ ΠΛΑΤΦΟΡΜΑ!</h1>
    <h2 > ΜΠΟΡΕΙΤΕ ΝΑ ΕΓΓΡΑΦΕΙΤΕ!</h2>
     
    </section>
    <form class="" action="" method="post" autocomplete="off">
        <label for="name" >Όνομα :</label>
        <input type="text" name="name" id="name" required value=""><br>
        <label for="email" >email :</label>
        <input type="email" name="email" id="email" required value=""><br>
        <label for="Password" >Κωδικός :</label>
        <input type="password" name="password" id="password" required value=""><br>
        <button type="submit" name="submit">Εγγραφή</button>
    </form>
    <br>
    <a href="login.php">Σύνδεση</a>
    <p><small>Copyright &copy; Omada web 2022-23</small></p>
    
    <script src="1ST JAVASCRIPT.js"></script>   
</body>
</html>