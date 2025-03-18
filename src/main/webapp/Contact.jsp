<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "Pet.email" %> 
<html>
<head>
    <title>Contact Us - Pawportal</title>
    <style>
        /* Add your CSS styles here */
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

<!-- Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" type="text/css" href="css/cont.css">
    <%--@include file="Includes/Header.jsp" --%>
</head>
<body >
    <nav class="navbar navbar-expand-lg navbar-light bg-light " style="position:fixed; top:0; width:100%; ">
  <a class="navbar-brand text-dark fontsize-500" href="#"><h1>PawPortal</h1><p style="color:green">Don't Shop | Just Adopt</p></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

 <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto ">
      <li class="nav-item active">
        <a class="nav-link text-dark" href="PetShop.jsp">Explore<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link text-dark" href="register.jsp">Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="Contact.jsp">Contact</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link text-dark" href="About.jsp">About</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Profile
        </a>
        <div class="dropdown-menu " aria-labelledby="navbarDropdown">
          <a class="dropdown-item " href="NewFile1.jsp">Log In</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="">My Account</a>
        </div> 
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="FilterServlet" method="post">
      <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0 text-dark" type="submit">Search</button>
    </form>
  </div> 
  </nav> 
    <div  class="container" style="margin-top:150px;">
        <h1>Contact Us</h1>
        <p>If you have any questions, feedback, or suggestions, please fill out the form below and we will get back to you as soon as possible.</p>
        <form method="post" action="sendEmail.jsp">
            <table class="table"  >
                <tr >
                    
                    <td class="td"><input type="text" class="form-control" id="name" name="name" placeholder="Give your name" required></td>
                </tr>
                <tr>  
                    <td class="td"><input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required></td>
                </tr>
                <tr>                    
                    <td class="td"><input type="text" id="subject" class="form-control" placeholder="Enter subject" name="subject" required></td>
                </tr>
                <tr>
                    <td class="td"><textarea id="message" name="message" rows="10" cols="40" class="form-control" placeholder="Click here to input..." required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Send" class="btn btn-primary" ></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
