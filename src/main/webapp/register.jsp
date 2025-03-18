<%-- <%@ page import = "Pet.dao.PetDao" %>--%>
<%@ page import = "Pet.PetDao" %>
<%@ page import = "java.util.*" %>
<%--<%@ page import = "Pet.Connection.DbCon" %> --%>
<%@ page import = "Pet.DbCon" %>
<%-- <%@ page import = "Pet.model.*" %>--%>
<%@ page import = "Pet.*" %>
<%if(session.getAttribute("gid")==null) 
{
	response.sendRedirect("login2.jsp");
}%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign In</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Fontawesome CDN Link -->	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
-->
<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">

</head>
<body>
<% 
if(request.getAttribute("status")!=null)
{%>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
<%} %>
<!--  <h1>PawPortal</h1> -->
<!--  <nav class="navbar navbar-expand-lg navbar-light bg-light ">
  <a class="navbar-brand text-dark fontsize-500" href="#"><h1>PawPortal</h1><p style="color:green">Don't Shop|Just Adopt</p></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
   </nav> -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light " style="position:fixed; top:0; width:100%;  opacity:1;  z-index: 999;">
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
        <a class="nav-link text-dark" href="Uploads.jsp">Uploads</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="Contact.jsp">Contact</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link text-dark" href="About.jsp">About</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-dark " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <%=session.getAttribute("name") %>
        </a>
        <div class="dropdown-menu " aria-labelledby="navbarDropdown">
          <a class="dropdown-item " href="logout1Servlet">Logout</a>
           <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="myacc.jsp">My Account</a>
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

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Register Your Animal here</h2>
					
						<form method="post" enctype="multipart/form-data" action="RegisterServlet" class="register-form"
							id="register-form">
							<input type="hidden" name="operation" value="addproduct" />
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Name of Animal(if any)" value="Unnamed" style="font-size:18px;"/>
							</div>
							<div class="form-group">
								<label for="Breed"><i class="zmdi zmdi-account material-icons-Breed"></i></label> <input
									type="Breed" name="Breed" id="Breed" placeholder="Breed" required style="font-size:18px;"/>
							</div>
							<div class="form-group">
								<label for="Location"><i class="zmdi zmdi-account material-icons-Location"></i></label> <input
									type="Location" name="Location" id="Location" placeholder="Current Location" required style="font-size:18px;"/>
							</div>
							<div class="form-group" style="padding-bottom:20px;">
								<label for="Age"><i class="zmdi zmdi-account material-icons-Age"></i></label>
								<input type="Age" name="Age" id="Age"
									placeholder="Age" required style="font-size:18px;"/>
							</div>
							<div class="custom-file" >
                            <label for="image" class="custom-file-label" >Choose an Image file</label>
                            <input type="file" name="image" id="image" class="custom-file-input" placeholder="Upload Image" accept="image" required style="font-size:18px;"/>
                            </div>
							<div class="form-group">
								<label for="highlight"><i class="zmdi zmdi-account material-icons-highlight"></i></label>
								<input type="highlight" name="highlight" id="highlight"
									placeholder="Any known characteristics in few words" required style="font-size:18px;"/>
							</div>
							<div class="form-group">
								<label for="description"><i class="zmdi zmdi-account material-icons-description"></i></label>
								<input type="description" name="description" id="description"
									placeholder="Describe" required style="font-size:18px;"/>
							</div>
							<div class="form-group">
								<label for="vaccinated"><i class="zmdi zmdi-account material-icons-vaccinated"></i></label>
								<input type="vaccinated" name="vaccinated" id="vaccinated"
									placeholder="vaccinated" required style="font-size:18px;"/>
							</div>
							<div class="form-group">
								<label for="Health"><i class="zmdi zmdi-account material-icons-Health"></i></label>
								<input type="Health" name="Health" id="Health"
									placeholder="Health" required style="font-size:18px;"/>
							</div>
							<div class="form-group" >
								<label for="gender"><i class="zmdi zmdi-account material-icons-gender"></i></label>
								<input type="gender" name="gender" id="gender"
									placeholder="gender" required style="font-size:18px;"/>
							</div>
							<div class="form-group">
								<!--  <label for="cid"><i class="zmdi zmdi-account material-icons-cid"></i></label>-->
								<!--<input type="" name="cid" id="cid"
									 placeholder="Category Id<br>1.Indian Breed Dog<br>2.Western Breed Dog<br>3.Indian Breed Cat<br>4.Western Breed Cat" />-->
									 <select name="cid" class = "form-select form-select-lg" aria-label = ".form-select-lg example" style="font-size:18px;">
									 <option value="1">Indian Breed Dog</option>
									 <option value="2">Western Breed Dog</option>
									 <option value="3">Indian Breed cat</option>
									 <option value="4">western Breed cat</option>
									 <option value="5">Others</option>
									 </select>
							</div>
							<div class="form-group">
								<label for="gid"><i class="zmdi zmdi-account material-icons-gid"></i></label>
							
							  <input type="hidden" name="gid" value="<%=session.getAttribute("gid") %>">
							  
								</div>
                            
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" required/> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button" >
								<input type="submit" name="register" id="register"
									class="form-submit" value="Register" style="font-size:18px;"/>
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="Animal_Images/sign.jpg" alt="sign up image">
						</figure>
					<!-- 	<a href="login1.jsp" class="signup-image-link">I am already
							member</a>  -->
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
	<script type="text/javascript">
	
	    var status = document.getElementById("status").value;
	    if(status == "success"){
		swal("Congrats","Animal Registered Successfully","success")//.then(function(){
			//window.location="login1.jsp";
		}
		else if(status=="failed"){
			swal("Sorry","Form contains invalid input","error");
		}
	</script>
	



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>