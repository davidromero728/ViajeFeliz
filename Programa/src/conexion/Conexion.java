package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	public static Connection conn;
	
	public Connection cargar() {
		String url = "";		
		conn = null;
		
		try {
			url = "jdbc:mysql://localhost/viaje_feliz?user=root&password=1234";
			conn = DriverManager.getConnection(url);
			
			return conn;
		} catch (Exception ex) {
			System.out.println("SQLException: " + ex.getMessage());
			
			return conn;
		}		
	}
}
