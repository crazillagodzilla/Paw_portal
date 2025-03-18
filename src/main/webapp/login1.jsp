<%--  <%@ page import = "Pet.dao.UserDao" %>
<%@ page import = "java.util.*" %>
<%@ page import = "Pet.Connection.DbCon" %>
<%@ page import = "Pet.model.*" %> --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
 
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible">

<title>Log In </title>
 
<link rel="stylesheet" href="css/style.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<%--@include file="Includes/Header.jsp" --%> 
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
 
<nav class="navbar navbar-expand-lg navbar-light bg-light " style="position:fixed; width:100%; top:0;">
  <a class="navbar-brand text-dark fontsize-500" href="#"><h1>PawPortal</h1><p style="color:green">Don't Shop|Just Adopt</p></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

 <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto ">
      <li class="nav-item active">
        <a class="nav-link text-dark" href="IndexHome.jsp">Home<span class="sr-only">(current)</span></a>
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
        <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
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
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0 text-dark" type="submit">Search</button>
    </form>
  </div> 
  </nav>


	<div class="main">

		<!-- log in  Form -->
		<section class="log-in">
			<div class="container" style="height:800px">
				<div class="login-content">
					<div class="login-image">
						<figure>
							<img src="Animal_Images/log2.jpg" alt="Login image">
						</figure>
						<a href="signin1.jsp" class="signup-image-link">Don't Have An Account? Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Log in as Adopter</h2>
						<form action="Login1Servlet" method="post"  class="login-form"
							id="login-form" id="myForm" >
							<div class="form-group">
								<label for="Email Address"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="email" name="login-email" id="email"
									placeholder="Enter Email" autocomplete="off"/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="login-password" id="password"
									placeholder="Enter Password" autocomplete="off" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
							</div>
							<div class="form-group form-button">
								<button type="submit" name="login" id="login"
									class="form-submit" >Log-in</button>
							</div>
							
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	
	    var status = document.getElementById("status").value;
	    if(status == "failed"){
		swal("Sorry","Wrong Email or Password","error");
	}
	</script>
	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>