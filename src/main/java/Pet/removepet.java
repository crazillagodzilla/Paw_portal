package Pet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.util.*;
@WebServlet("/removepet")
public class removepet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		RequestDispatcher dispatcher=null;
		Connection con;
        try
        {
        	con=DbCon.getConnection();
        PetDao pd=new PetDao(con);
        int id=Integer.parseInt(request.getParameter("Id")) ;
        boolean f=pd.deleteProductById(id);
        if(f==true)
        {
        request.setAttribute("status","s");
        }
        else if(f==false)
        {
        	request.setAttribute("status","ss");
        }
        
      
        }
        catch(Exception e)
        {
        	e.getStackTrace();
        	request.setAttribute("status","failed");
        	
        }
        
        dispatcher =request.getRequestDispatcher("Uploads.jsp");
        dispatcher.forward(request, response);
        // Forward to result page
       
    }
	
}