package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class utils {
	private static Connection conn = null;
	private static String url = "jdbc:mysql://localhost:3306/computer";
	private static String user = "root";
	private static String password = "root";
	static{
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		try{
			conn = DriverManager.getConnection(url,user,password);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn) {
		if(conn!=null){
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
}
