package Pet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/pawportal?allowPublicKeyRetrieval=true&useSSL=false","root","Pawportal$004");
            System.out.print("connected");
        }
        return connection;
    }
}
