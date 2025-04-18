//package Pet.dao;
package Pet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.sql.Blob;
//import Pet.model.*;
//import Pet;
import java.sql.Statement;
public class PetDao {
	private Connection con;
	private String query;

	private PreparedStatement pst;
	private ResultSet rs;
	
	public PetDao(Connection con) {
		this.con = con;
	}
	public int getProIdByName(String name)
	{
		int Id=0;
		
		try {
		String q="select Id from Product where Name= ? ";
		PreparedStatement st=this.con.prepareStatement(q);
		st.setString(1,name);
		ResultSet set=st.executeQuery();
		while(set.next())
		{
		Id=set.getInt("Id");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return Id;
	}
	
	 public List<Category> getAllCategories() {
	        List<Category> Category = new ArrayList<>();

	        try {

	            String q = "select * from Category";
	            Statement st = this.con.createStatement();
	            ResultSet set = st.executeQuery(q);
	            while (set.next()) {
	                int cid = set.getInt("cid");
	                String cname = set.getString("cname");
	               
	                Category c = new Category(cid, cname);
	                Category.add(c);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return Category;
	    }
	 
	
	public List<Product> getAllProducts() {
		List<Product> Product = new ArrayList<Product>();
		try {
			query = "select Id,Name,Breed,Location,Age,image from Product";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("Id"));
				row.setName(rs.getString("Name"));
				row.setBreed(rs.getString("Breed"));
				row.setLocation(rs.getString("Location"));
				row.setAge(rs.getInt("Age"));
				Blob imageBlob = rs.getBlob("image");
                byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                row.setImage(imageData);
				//row.setImage(rs.getString("image"));
				
				Product.add(row);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return Product;
	}
	public int getProductCountbyId() {
	    int count = 0;
	    try {
	        query = "SELECT cid,COUNT(*) as count FROM Product GROUP BY cid";
	        pst = this.con.prepareStatement(query);
	        rs = pst.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt("count");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	public int getProductCount() {
	    int count = 0;
	    try {
	        query = "SELECT COUNT(*) as count FROM Product";
	        pst = this.con.prepareStatement(query);
	        rs = pst.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt("count");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	
	public Product getProductById(int Id) {
	
    Product pro = null;
    String q = "select * from Product where Id=?";
    try {
        PreparedStatement p = this.con.prepareStatement(q);
        p.setInt(1, Id);

        ResultSet set = p.executeQuery();

        while(set.next()) {
            //pro = new Product();
            int id = set.getInt("Id");
            String Name = set.getString("Name");
            String Breed = set.getString("Breed");
            String Location = set.getString("Location");
            int Age = set.getInt("Age");
            //String image = set.getString("image");
            Blob imageBlob = set.getBlob("image");
            byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
            String highlight = set.getString("highlight");
            String description = set.getString("description");
            String vaccinated = set.getString("vaccinated");
            String Health= set.getString("Health");
            String gender = set.getString("gender");
            int cid = set.getInt("cid");
            int gid = set.getInt("gid");
           // String gname = set.getString("gname");
            //Timestamp date = set.getTimestamp("pDate");
            //int cid=set.getInt("catId");
            //int uid = set.getInt("userId");
            pro = new Product(id, Name, Breed, Location, Age, imageData,highlight,description,vaccinated,Health,gender,cid,gid);
            
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return pro;
}
	
	
	
	public List<Product> getProductByGid(int gid) {
		List<Product> Product = new ArrayList<Product>();
		try {
			query = "select Id,Name,Breed,Location,Age,image from Product where gid=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, gid);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("Id"));
				row.setName(rs.getString("Name"));
				row.setBreed(rs.getString("Breed"));
				row.setLocation(rs.getString("Location"));
				row.setAge(rs.getInt("Age"));
				//row.setImage(rs.getString("image"));
				Blob imageBlob = rs.getBlob("image");
                byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
                row.setImage(imageData);
				Product.add(row);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return Product;
	}
	
	
	
	public Gaurdian getGaurdianByGid(int gid) {
		Gaurdian g = null;//g
	    String q = "select * from Admin where gid=?";
	    try {
	        PreparedStatement p = this.con.prepareStatement(q);
	        p.setInt(1, gid);

	        ResultSet set = p.executeQuery();

	        if (set.next()) {
	           // pro = new Product();
	            int gid1 = set.getInt("gid");
	            String gname = set.getString("gname");
	            String gmail = set.getString("gmaill");
	            String gpassword =  set.getString("gpassword");;
	            String gmobile = set.getString("gmobile");
	            
	            g = new Gaurdian(gid1,  gname ,gpassword, gmail,gmobile);

	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return g;
	}
	public Gaurdian getUserByid(int id) {
		Gaurdian g = null;//g
	    String q = "select * from users where uid=?";
	    try {
	        PreparedStatement p = this.con.prepareStatement(q);
	        p.setInt(1, id);

	        ResultSet set = p.executeQuery();

	        if (set.next()) {
	           // pro = new Product();
	            int gid1 = set.getInt("uid");
	            String gname = set.getString("uname");
	            String gmail = set.getString("uemail");
	            String gpassword =  set.getString("upassword");;
	            String gmobile = set.getString("umobile");
	            
	            g = new Gaurdian(gid1,  gname ,gpassword, gmail,gmobile);

	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return g;
	}
	public boolean deleteProductById(int Id) {
	    try {
	        String query = "DELETE FROM Product WHERE id=?";
	        PreparedStatement pst = this.con.prepareStatement(query);
	        pst.setInt(1, Id);
	        int affectedRows = pst.executeUpdate();
	        if (affectedRows > 0) {
	            return true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return false;
	}
	
	
	
	
	 
	   public List<Product> getProductByCatId(int cid,int cid2) {
		   // Session s = this.Dbcon.openSession();
	        List<Product> list = new ArrayList<Product>();
	        //fetch all post by id
	        //fetch all the post
	        try {

	            PreparedStatement p = con.prepareStatement("select * from Product where cid=? or cid=?");
	            p.setInt(1, cid);
	            p.setInt(2, cid2);
	            ResultSet set = p.executeQuery();

	            while (set.next()) {

	            	int id = set.getInt("Id");
	                String Name = set.getString("Name");
	                String Breed = set.getString("Breed");
	                String Location = set.getString("Location");
	                int Age = set.getInt("Age");
	                //String image = set.getString("image");
	                Blob imageBlob = set.getBlob("image");
	                byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
	                
	                String highlight = set.getString("highlight");
	                String description = set.getString("description");
	                String vaccinated = set.getString("vaccinated");
	                String Health= set.getString("Health");
	                String gender = set.getString("gender");
	                int catId = set.getInt("cid");
	                int gid = set.getInt("gid");
	                //String gname = set.getString("gname");
	                //Timestamp date = set.getTimestamp("pDate");

	                //int userId = set.getInt("userId");
	                Product prod = new Product(id, Name, Breed, Location, Age,imageData,highlight,description,vaccinated,Health,gender,catId,gid);

	                list.add(prod);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	   
	   
	   public List<Product> getProductByGender(String gender) {
		   // Session s = this.Dbcon.openSession();
	        List<Product> list = new ArrayList<Product>();
	        //fetch all post by id
	        //fetch all the post
	        try {

	            PreparedStatement p = con.prepareStatement("select * from Product where gender=?");
	            p.setString(1, gender);
	            ResultSet set = p.executeQuery();

	            while (set.next()) {

	            	int id = set.getInt("Id");
	                String Name = set.getString("Name");
	                String Breed = set.getString("Breed");
	                String Location = set.getString("Location");
	                int Age = set.getInt("Age");
	                //String image = set.getString("image");
	                Blob imageBlob = set.getBlob("image");
	                byte[] imageData = imageBlob.getBytes(1, (int) imageBlob.length());
	                
	                String highlight = set.getString("highlight");
	                String description = set.getString("description");
	                String vaccinated = set.getString("vaccinated");
	                String Health= set.getString("Health");
	                String Gender = set.getString("gender");
	                int catId = set.getInt("cid");
	                int gid = set.getInt("gid");
	                //String gname = set.getString("gname");
	                //Timestamp date = set.getTimestamp("pDate");

	                //int userId = set.getInt("userId");
	                Product prod = new Product(id, Name, Breed, Location, Age, imageData,highlight,description,vaccinated,Health,Gender,catId,gid);

	                list.add(prod);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	   
	   
	  
	 
	
	

}
