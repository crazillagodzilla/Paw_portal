//package Pet.Signin;
package Pet;
/**import Pet.dao.CategoryDao;
import Pet.dao.PetDao;
import Pet.Connection.DbCon;
import Pet.model.*;
*/
//import java.util.*;
//import java.io.IOException;

import java.io.PrintWriter;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.ServletException;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

//import Pet.model.Product;
//import Pet;
/**
 * Servlet implementation class RegisterServlet
 */

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("Working");
		 HttpSession session = request.getSession();
		 RequestDispatcher dispatcher = null;
		 Connection con = null;
		  
		String op = request.getParameter("operation");
		if(op.trim().equals("addproduct"))
		{
		  String Name = request.getParameter("name");
		  String Breed= request.getParameter("Breed");
		  String Location= request.getParameter("Location");
		  int Age= Integer.parseInt(request.getParameter("Age"));		  
		  String highlight= request.getParameter("highlight");
		  String description= request.getParameter("description");
		  String vaccinated =request.getParameter("vaccinated");
		  String Health= request.getParameter("Health");
		  String gender =request.getParameter("gender");
		  int cid= Integer.parseInt(request.getParameter("cid"));
		  
		 // HttpSession session = request.getSession();
		  //String image=request.getParameter("image");
		  int gid = (int) session.getAttribute("gid");
		  
		  Part image= request.getPart("image");
		  //File imageFile = new File(image); // Replace with your image file path
          InputStream fis = image.getInputStream();
		  
		  
		 try
		 {
			 Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pawportal?useSSL=false","root","Pawportal$004");
				PreparedStatement pst = con.prepareStatement("insert into Product (Name,Breed,Location,Age,image,highlight,description,vaccinated,Health,gender,cid,gid) values(?,?,?,?,?,?,?,?,?,?,?,?)");
				pst.setString(1, Name);
				pst.setString(2, Breed);
				pst.setString(3, Location);
				pst.setInt(4, Age);
				//pst.setString(5,part.getSubmittedFileName() );
				pst.setBlob(5,fis);
				pst.setString(6, highlight);
				pst.setString(7, description);
				pst.setString(8, vaccinated);
				pst.setString(9, Health);
				pst.setString(10, gender);
				pst.setInt(11, cid);
				//session.setAttribute("gid",pst.getInt("gid"));
				//dispatcher = request.getRequestDispatcher("register.jsp");
				pst.setInt(12,gid);
				
				
				
				int rowCount = pst.executeUpdate();
				dispatcher = request.getRequestDispatcher("register.jsp");
				
				if(rowCount>0) {
					request.setAttribute("status","success");
					//dispatcher = request.getRequestDispatcher("login1.jsp");
				}
				else {
					request.setAttribute("status","failed");
				}
				dispatcher.forward(request, response);
				
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		  
		  
		  
		  
		  
		  
		  
		  
       }
		
	}
}
