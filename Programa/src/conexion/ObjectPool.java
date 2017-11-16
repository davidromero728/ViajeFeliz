package conexion;

import java.sql.Connection;
import java.util.ArrayList;

public class ObjectPool {
	static ArrayList<Connection> conexionesDisponibles = new ArrayList<Connection>();
	static ArrayList<Connection> conexionesEnUso = new ArrayList<Connection>();
	
	public static void generarConexiones(int n) {
		for(int i = 1; i <= n; i++) {
			conexionesDisponibles.add(new LoadDriver().driver());
		}
	}
	
	public static Connection getConnection() {
		Connection con = null;
		
		if(conexionesDisponibles.isEmpty()) {
			con = new LoadDriver().driver();
			conexionesDisponibles.add(con);
		} else {
			con = conexionesDisponibles.get(0);
			conexionesEnUso.add(con);
			conexionesDisponibles.remove(0);
		}
		
		return con;
	}
	
	public static void releaseConnection(Connection con) {
		conexionesDisponibles.add(con);
		conexionesEnUso.remove(con);
	}
}
