package conexion;

import java.sql.Connection;

public class LoadDriver {
	public Connection driver() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			Conexion cone = new Conexion();
			conn = cone.cargar();			
			
			System.out.println("Conexi�n exitosa");
		} catch (Exception ex) {
			System.out.println("Error driver: " + ex.getMessage());
		}
		
		return conn;
	}
}
