package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import dto.PropiedadUsuarioDTO;

public class PropiedadUsuarioDAO {
	Connection conn;
	
	public void insertPropiedadUsuario(PropiedadUsuarioDTO propUsu) {
		conn = conexion.ObjectPool.getConnection();
		
		try {
			String sql = "INSERT INTO propiedad_usuario (idusuario_propiedadusuario, idpropiedad_propiedadusuario) VALUES ('" 
					+ propUsu.getIdUsuario() + "', '" + propUsu.getIdPropiedad() + "')";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error insert propiedadUsuario: " + ex.getMessage());
		}
	}
	
	public ArrayList<PropiedadUsuarioDTO> selectPropiedadUsuario(String pu) {
		conn = conexion.ObjectPool.getConnection();
		
		ArrayList<PropiedadUsuarioDTO> listaPu = new ArrayList<PropiedadUsuarioDTO>();
		
		try {
			String sql = "SELECT * FROM propiedad_usuario WHERE idusuario_propiedadusuario = '" + pu + "'";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				PropiedadUsuarioDTO propusudto = new PropiedadUsuarioDTO();
				propusudto.setIdPropiedadUsuario(Integer.parseInt(rs.getString("id_propiedadusuario")));
				propusudto.setIdUsuario(Integer.parseInt(rs.getString("idusuario_propiedadusuario")));
				propusudto.setIdPropiedad(Integer.parseInt(rs.getString("idpropiedad_propiedadusuario")));
				
				listaPu.add(propusudto);
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select propiedadUsuario: " + e.getMessage());
		}
		
		return listaPu;
	}
}
