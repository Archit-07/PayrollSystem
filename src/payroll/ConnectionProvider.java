package payroll;
import java.sql.*;
public class ConnectionProvider
{

		public static Connection getConnection()
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");
				return con;
			}
			catch(Exception e)
			{
				System.out.println("Exception in provider="+e);
				return null;
			}
			
		}
}
