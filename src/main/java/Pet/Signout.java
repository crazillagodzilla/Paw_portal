package Pet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Signout")
public class Signout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String query="";
        int id;
        PreparedStatement ps;
        int i=0;
        try {
        	
        	Connection con=DbCon.getConnection();
        	if(session.getAttribute("gid")!=null) 
            {
            	id=(int)session.getAttribute("gid");
            	query = "DELETE FROM Admin WHERE gid=?";
            	ps = con.prepareStatement(query);
                ps.setInt(1, id);
                i = ps.executeUpdate();
            }
            else if(session.getAttribute("uid")!=null)
            {
            	id=(int)session.getAttribute("uid");
            	query = "DELETE FROM users WHERE uid=?";
            	 ps = con.prepareStatement(query);
                ps.setInt(1, id);
                i = ps.executeUpdate();
            }

             
            if (i > 0) {
                out.println("User successfully removed...");
                getServletConfig().getServletContext().getRequestDispatcher("/IndexHome.jsp").forward(request, response);
                session.invalidate();
                
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}