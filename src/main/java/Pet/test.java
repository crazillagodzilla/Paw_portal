package Pet;
import java.sql.*;
import javax.mail.internet.MimeMessage;
class test {
	 
    // Main driver method
    public static void main(String[] args)
    {
 
        // Try block to check if any exceptions occur
        try {
 
            // Step 2: Loading and registering drivers
 
            // Loading driver using forName() method
            Class.forName("com.mysql.cj.jdbc.Driver");
 
            // Registering driver using DriverManager
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/pawportal?allowPublicKeyRetrieval=true&useSSL=false","root","Pawportal$004");
 
            // Step 3: Create a statement
            Statement statement = con.createStatement();
            String sql = "select * from Admin where gmaill='jevdeve@gmail.com' and gpassword='ppoo#789'";
 
            // Step 4: Execute the query
            ResultSet result = statement.executeQuery(sql);
 
            // Step 5: Process the results
 
            // Condition check using hasNext() method which
            // holds true till there is single element
            // remaining in List
            while (result.next()) {
                int id=result.getInt("gid");
                System.out.println(id);
                
            }
        }
 
        // Catching database exceptions if any
        catch (SQLException e) {
 
            // Print the exception
            System.out.println(e);
        }
 
        // Catching generic ClassNotFoundException if any
        catch (ClassNotFoundException e) {
 
            // Print and display the line number
            // where exception occurred
            e.printStackTrace();
        }
    }
}