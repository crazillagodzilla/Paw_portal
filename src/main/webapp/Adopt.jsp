<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home-PawPortal</title>

<head>
<title>Welcome To PawPortal</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="css/HomeDemo.css">



    <!-- Fontawesome CDN Link -->
    
	
	
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%--@include file="Includes/Header.jsp" --%>
</head>
<body>
<div class="bgimg">

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
        <a class="nav-link text-dark" href="register.jsp">Register</a>
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
       <!--   <div class="dropdown-divider"></div>
           <a class="dropdown-item " href="logout1Servlet"><%--<%=session.getAttribute("name") %>--%></a>  -->  
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
  <section style="background-image:url('Animal_Images/cat2.jpg'); width:100%; height:950px; background-repeat:no-repeat; background-size:100% 100%">
  <div class="container text-center text-white hearderset" >
  <h2>Congratulations for Taking a Step Towards this Free Stray Pet Adoption</h2>
  <h3>Click the Button Below to start a questionnaire Round about Pet Adoption , This will be used for our information to keep record.</h3>
  <button class="btn btn-dark text-white btn-lg" onclick="window.location.href='https://ryan8.aidaform.com/free-product-information-enquiry-form';" >START</button>
  
  </div >
  </section>
  </div>
  </body>
  </html>