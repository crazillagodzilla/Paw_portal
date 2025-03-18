<%--<%@ page import = "Pet.dao.PetDao" %> --%>
<%@ page import = "Pet.PetDao" %>
<%@ page import = "java.util.*" %>
<%-- <%@ page import = "Pet.Connection.DbCon" %>--%>
<%@ page import = "Pet.DbCon" %>
<%--<%@ page import = "Pet.model.*" %> --%>
<%@ page import = "Pet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 Gaurdian g=null;
 int Id=0;
	 if(session.getAttribute("gid")!=null)
	 {
		 Id=(int)session.getAttribute("gid");
		 PetDao pd=new PetDao(DbCon.getConnection());
	      g=pd.getGaurdianByGid(Id);
	 }
	 else if(session.getAttribute("uid")!=null)
	 {
		 Id=(int)session.getAttribute("uid");
		 PetDao pd=new PetDao(DbCon.getConnection());
		 g=pd.getUserByid(Id);
	 }
	 else
	 {
		 response.sendRedirect("NewFile1.jsp");
	 }
 %>
 
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="alert/dist/sweetalert.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
<%-- <%@include file="Includes/Header.jsp" %>--%>
  <link rel="stylesheet" type="text/css" href="css/HomeDemo.css"> 
 

<meta charset="UTF-8">
<%if(g!=null) {%>
<title>Product Description Page<%=g.getgname()%></title>
<%} %>
<style>

/* CSS */
.button-33 {
  background-color: #c2fbd7;
  border-radius: 100px;
  box-shadow: rgba(44, 187, 99, .2) 0 -25px 18px -14px inset,rgba(44, 187, 99, .15) 0 1px 2px,rgba(44, 187, 99, .15) 0 2px 4px,rgba(44, 187, 99, .15) 0 4px 8px,rgba(44, 187, 99, .15) 0 8px 16px,rgba(44, 187, 99, .15) 0 16px 32px;
  color: green;
  cursor: pointer;
  display: inline-block;
  font-family: CerebriSans-Regular,-apple-system,system-ui,Roboto,sans-serif;
  padding: 7px 20px;
  text-align: center;
  text-decoration: none;
  transition: all 250ms;
  border: 0;
  font-size: 16px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-33:hover {
  box-shadow: rgba(44,187,99,.35) 0 -25px 18px -14px inset,rgba(44,187,99,.25) 0 1px 2px,rgba(44,187,99,.25) 0 2px 4px,rgba(44,187,99,.25) 0 4px 8px,rgba(44,187,99,.25) 0 8px 16px,rgba(44,187,99,.25) 0 16px 32px;
  transform: scale(1.05) rotate(-1deg);
}
</style>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light ">
  <!--<a class="navbar-brand text-dark fontsize-500" href="#"><h1>PawPortal</h1><p style="color:green">Don't Shop|Just Adopt</p></a>-->
  <a class="navbar-brand text-dark fontsize-500" href="#">
  <h1>PawPortal</h1>
  <span style="color:green">Don't Shop|Just Adopt</span>
 </a>
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
      <li class="nav-item dropdown" >
        <a class="nav-link dropdown-toggle text-dark " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
          <%=session.getAttribute("name") %>
        </a>
        <div class="dropdown-menu " aria-labelledby="navbarDropdown">
          <a class="dropdown-item " href="logout1Servlet">Logout</a>
          <!--  <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="">My Account</a>-->
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0 text-dark" type="submit">Search</button>
    </form>
  </div>
  </nav>
 
	 
	
	 
  <%if(g!=null){ %>	  
  <div class="container">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title" align="center" style="color:blue;"><%=g.getgname()%></h3>
          <!--  <h6 class="card-subtitle">White Indie Dog</h6> --> 
            
                </div>
                <div align="center">
                
                <button  class="button-33" role="button" id="del" >Delete Account</button>
                <input type="hidden" name="id" value=<%=g.getgid() %>>
                
                </div>
                
                    <h3 class="box-title mt-5" align="center">General Information</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-product">
                            <tbody>
                                <tr>
                                    <td width="390">Name</td>
                                    <td><%=g.getgname()%></td>
                                </tr>
                                <tr>
                                    <td width="390">Email</td>
                                    <td><%=g.getgmail()%></td>
                                </tr> 
                                <tr>
                                    <td width="390">Mobile no.</td>
                                    <td><%=g.getgmobile()%></td>
                                </tr>
                                
                                                 
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
       
    
    <%}
  else{%>
	  <input type="hidden" id="status" value="fail">
  <%}%>
  
    <!--  <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>-->
	<script type="text/javascript">
	document.getElementById("del").addEventListener("click", function() {
        // Show SweetAlert dialog
        Swal.fire({
            title: "Confirmation",
            text: "Are you sure you want to proceed?",
            icon: "warning",
            showConfirmButton:true,
            showCancelButton: true,
            cancelButtonText: "Cancel", 
            confirmButtonText: "Proceed",
            closeOnCancel: true,
        }).then((result) => {
        	
            if (result.isConfirmed) {
                
                window.location.href = "Signout";
            	//window.location.href="IndexHome.jsp";
            } else if (result.isDismissed) {
               
                console.log("User canceled");
            }
            
        });
    });
    </script>

 
<!--  </div>-->
  

 
</body>
</html>

