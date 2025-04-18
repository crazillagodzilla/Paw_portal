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
 int Id=0;
 PetDao pd = new PetDao(DbCon.getConnection());
 
 if(request.getParameter("Id")!=null)
 {
 Id = Integer.parseInt(request.getParameter("Id"));

 }
 else if(request.getAttribute("Id")!=null)
 {
	 Id =(Integer)request.getAttribute("Id");
	
 }
 Product p = pd.getProductById(Id);
 System.out.print(Id);
 %>
 <% 
   if(session.getAttribute("uid")==null){
	   response.sendRedirect("login1.jsp");
   }
   %>
<!DOCTYPE html>
<html>
<head>

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
<%if(p!=null) {%>
<title>Product Description Page<%=p.getName()%></title>
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
   <nav class="navbar navbar-expand-lg navbar-light bg-light " style="position:fixed; top:0; width:100%; z-index:999; opacity:1;">
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
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-dark " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <%=session.getAttribute("name") %>
        </a>
        <div class="dropdown-menu " aria-labelledby="navbarDropdown">
          <a class="dropdown-item " href="logout1Servlet">Logout</a>
          <!--  <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="">My Account</a>-->
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="FilterServlet" method="post">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0 text-dark" type="submit">Search</button>
    </form>
  </div>
  </nav>
 
	 
	
	 
  <%if(p!=null){ %>	  
  <div class="container" style="margin-top:130px; z-index:-999px; ">
    <div class="card" >
        <div class="card-body">
            <h3 class="card-title"><%=p.getName()%></h3>
          <!--  <h6 class="card-subtitle">White Indie Dog</h6> --> 
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                <% String base64Image=p.getImage(); %>
               <div class="card white-box text-center">
                <img src=<%=base64Image %> class="card-img img-fluid img-responsive" alt="Nothing"> 
               <!--<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4
        //8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==" class="card-img img-fluid img-responsive" alt="Nothing">-->
               </div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-6">
                    <h4 class="box-title mt-5">Description</h4>
                    <p><%=p.getdescription() %></p>
              <!--     <h2 class="mt-5">
                        Friendly with Everyone<small class="text-success"></small>
                    </h2> -->  
              <!-- <button class="btn btn-dark btn-rounded mr-1" data-toggle="tooltip" title="" data-original-title="Add to cart">
                        <!-- <i class="fa fa-shopping-cart"></i>  -->
                    
                   
                    <h3 class="box-title mt-5">Highlights</h3>
                    <ul class="list-unstyled">
                        <li><!-- <i class="fa fa-check text-success"></i> --><%=p.gethighlight() %></li>
                    <!--  <li><i class="fa fa-check text-success"></i>Loyal and Loving</li>
                        <li><i class="fa fa-check text-success"></i>Energetic</li>  -->   
                    </ul>
                    <button class="button-33" role="button" onclick="window.location.href='inquiry.jsp?gid=<%=p.getgid() %>'">Start Inquiry</button>
                     <button  class="button-33" role="button" onclick="window.location.href='Adopt.jsp';">Adopt</button>
                      
                    <!--  
                     <button class="btn btn-primary btn-rounded">Start Inquiry</button>
                      <a href="PDetails.jsp?Id=<%--<%=p.getgid() %> --%>" class="btn btn-primary">See</a> 
                     
                     <button class="btn btn-primary btn-rounded">Adopt</button>
                      <button class="btn btn-primary btn-rounded">Add To Bag</button> -->
                </div>
                
                    <h3 class="box-title mt-5">General Information</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-product">
                            <tbody>
                                <tr>
                                    <td width="390">Name</td>
                                    <td><%=p.getName()%></td>
                                </tr>
                                <tr>
                                    <td>Current Location</td>
                                    <td><%=p.getLocation() %></td>
                                </tr>
                                <tr>
                                    <td>Age</td>
                                    <td><%=p.getAge() %></td>
                                </tr>
                                <tr>
                                    <td>Breed</td>
                                    <td><%= p.getBreed() %></td>
                                </tr>
                                <tr>
                                    <td>Vaccinated</td>
                                    <td><%=p.getvaccinated() %></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><%=p.getgender() %></td>
                                </tr>
                                <tr>
                                    <td>Healthy?</td>
                                    <td><%=p.getHealth() %></td>
                                </tr>
                                 
                                 
                               
                               
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%}
  else{%>
	  <input type="hidden" id="status" value="fail">
  <%}%>
  
    <script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
	<script type="text/javascript">
	
	    var status = document.getElementById("status").value;
	    if(status=="fail"){	    			
			swal("Sorry","Profile not found","error")
	    }
	
	</script>
   
 

 
<!--  </div>-->
  

 
</body>
</html>







<!-- HTML !-->
