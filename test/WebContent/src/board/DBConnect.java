package board;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public DBConnect() {}
	
	public Connection getConnection() {
		String url = "jdbc:odbc:board2";
		String id = "";
		String pass = "";
		
		Connection con = null;
		
		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection(url,id,pass);
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
