console.log("hello");



/*
// validation ths formas diaxeiristi
function showForm() {
    document.getElementById("form").style.display = "block";
  }



      function validateForm() {
    var x = document.forms["forma2"]["usra"].value;
    var y = document.forms["forma2"]["passa"].value;
   
   
    if (x == "" || y == "" || z == "") {
      document.getElementById("alert").style.display = "block";
      return false;
    }
}

// validation ths formas gia xrhsth
function validateForma2() {
  var x = document.forms["myForm"]["usr"].value;
  var y = document.forms["myForm"]["pass"].value;
  var z = document.forms["myForm"]["email"].value;
  if (!validatePassword()) {
    return false;
  }
  if (x == "" || y == "" || z == "") {
    document.getElementById("alert").style.display = "block";
    return false;
  }else{
    document.getElementById("form").action = "HTML 2ND PAGE.htm";
    document.getElementById("form").method = "post";
    return;
  }
}
*/

/*

function validatePassword() {
  var password = document.getElementById("password").value;
  var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
  
  if (!passwordRegex.test(password)) {
      alert("Password must have at least 8 characters, one capital letter, one number, and one symbol (!@#$%^&*)");
      return false;
  }
  
  return true;
}
*/

/*
// validation password
function validatePassword() {
  var password = document.forms["myForm"]["pass"].value;
  
  var hasCapital = false;
  var hasSymbol = false;
  
 
  if (password.length < 8) {
    alert("Ο ΚΩΔΙΚΟΣ ΧΡΗΣΤΗ ΠΡΕΠΕΙ ΝΑ ΕΧΕΙ ΤΟΥΛΑΧΙΣΤΟΝ 8 ΧΑΡΑΚΤΗΡΕΣ.");
    return false;
  }
  
  for (var i = 0; i < password.length; i++) {
    if (password[i] === password[i].toUpperCase() && password[i] !== password[i].toLowerCase()) {
      hasCapital = true;
      break;
    }
  }
  if (!hasCapital) {
    alert("Ο ΚΩΔΙΚΟΣ ΧΡΗΣΤΗ ΠΡΕΠΕΙ ΝΑ ΕΧΕΙ ΤΟΥΛΑΧΙΣΤΟΝ 1 ΚΕΦΑΛΑΙΟ ΧΑΡΑΚΤΗΡΑ.");
    return false;
  }
 
  for (var i = 0; i < password.length; i++) {
    if (password[i].match(/[!@#$%^&*(),.?":{}|<>]/)) {
      hasSymbol = true;
      break;
    }
  }
  if (!hasSymbol) {
    alert("Ο ΚΩΔΙΚΟΣ ΧΡΗΣΤΗ ΠΡΕΠΕΙ ΝΑ ΕΧΕΙ ΤΟΥΛΑΧΙΣΤΟΝ 1 ΣΥΜΒΟΛΟ (π.χ. #$*&@).");
    return false;
  }
  //  valid

  return true;
}
*/

// gia thn emfanizomenh etiketa kalws hrthate , na emfanizetai eksafanizetai otan scroll konta
const observer = new IntersectionObserver((entries)=>{
  entries.forEach((entry) =>{
    console.log(entry)
    if (entry.isIntersecting){
      entry.target.classList.add('show');
    } else {
      entry.target.classList.remove('show');
    }
  });
});

const hiddenElements= document.querySelectorAll('.hidden');
hiddenElements.forEach((el) => observer.observe(el));
 


/*
//ajax gia sundesh
document.addEventListener("DOMContentLoaded", function () {
  const adminLoginForm = document.getElementById("forma2");
  adminLoginForm.addEventListener("submit", function (event) {
    event.preventDefault(); // gia submit 

    const username = document.forms["forma2"]["usra"].value;
    const password = document.forms["forma2"]["passa"].value;

    //  AJAX request with jQuery 
    $.ajax({
      method: "GET",
      url: "SQL_CON.php", 
      data: {
        username: username,
        password: password
      },
      success: function (response) {
        console.log("Response:", response); // response from the server
        try {
          var jsonResponse = JSON.parse(response);
      
          if (jsonResponse.status === "success") {
            // Redirect 
            window.location.href = "HTML 2ND PAGE DIAX.html";
          } else {
            // failure
            console.log("Login failed. Please check your username and password.");
          }
        } catch (error) {
          console.error("Error parsing JSON response: " + error);
        }
      
      
      
      },
      error: function (xhr, status, error) {
        console.error("Error: " + error);
      }
    });
  });
});


*/