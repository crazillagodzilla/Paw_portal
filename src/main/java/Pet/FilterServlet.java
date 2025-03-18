package Pet;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.*;
@WebServlet("/FilterServlet")
public class FilterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		 List<Product> prolist=new ArrayList<Product>();   
        try
        {
        System.out.print(request.getParameter("search"));
        PetDao pd = new PetDao(DbCon.getConnection());
        if(request.getParameter("search")!=null)
        {
         String name=request.getParameter("search");
         int id=pd.getProIdByName(name);
         request.setAttribute("Id",id);
         getServletConfig().getServletContext().getRequestDispatcher("/PDetails.jsp").forward(request, response);
        }
        else
        {
        if (request.getParameter("dogs") != null) {
        	prolist=pd.getProductByCatId(1, 2);
        	
            
        } 
        else if (request.getParameter("cats") != null) {
            prolist=pd.getProductByCatId(3, 4);
        } 
        else if(request.getParameter("western")!=null){
        	prolist=pd.getProductByCatId(2,4);
        }
        else if(request.getParameter("indian")!=null)
        {
        	prolist=pd.getProductByCatId(1,3);
        }
        else if(request.getParameter("others")!=null) {
        	prolist=pd.getProductByCatId(0, 5);
        }
        else
        {
        	prolist=pd.getAllProducts();
        }
        request.setAttribute("Filt",prolist);
        getServletConfig().getServletContext().getRequestDispatcher("/PetShop.jsp").forward(request, response);
        }
        
        }
        catch(Exception e)
        {
        	e.getStackTrace();
        }
        
        
        // Forward to result page
        
    }
	
}

