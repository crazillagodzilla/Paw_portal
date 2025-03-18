//package Pet.Signin;
package Pet;
import java.io.IOException;
import java.sql.DriverManager;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import javax.servlet.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
//import java.sql.SQLException;

/**
 * Servlet implementation class Login1Servlet
 */
@WebServlet("/Login1Servlet")
public class Login1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail = request.getParameter("login-email");
		String upassword = request.getParameter("login-password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/pawportal?useSSL=false","root","Pawportal$004");
			PreparedStatement pst = con.prepareStatement("select * from users where uemail=? and upassword=?");
			pst.setString(1, uemail);
			pst.setString(2, upassword);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				session.setAttribute("uid", rs.getInt("uid"));
				session.setAttribute("name",rs.getString("uname"));
				dispatcher = request.getRequestDispatcher("PetShop.jsp");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login1.jsp");
			}
			dispatcher.forward(request, response);
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}

}
