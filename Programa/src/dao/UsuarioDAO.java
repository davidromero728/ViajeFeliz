package dao;

import java.sql.Connection;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

import dto.UsuarioDTO;

public class UsuarioDAO {
	Connection conn;
	
	public void insertUsuario(UsuarioDTO usuario) {
		conn = conexion.ObjectPool.getConnection();
		
		try {
			String sql = "INSERT INTO usuario (nick_usuario, clave_usuario) VALUES ('" + usuario.getNickUsuario() + 
					"', '" + usuario.getClaveUsuario() + "')";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error insert usuario: " + ex.getMessage());
		}
	}
	
	public UsuarioDTO selectUsuario(String user) {
		conn = conexion.ObjectPool.getConnection();
		
		UsuarioDTO usudto = new UsuarioDTO();
		
		try {
			String sql = "SELECT * FROM usuario WHERE nick_usuario = '" + user + "'";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				usudto.setIdUsuario(Integer.parseInt(rs.getString("id_usuario")));
				usudto.setNickUsuario(rs.getString("nick_usuario"));
				usudto.setClaveUsuario(rs.getString("clave_usuario"));
				usudto.setNombreCompletoUsuario("nombrecompleto_usuario");
				usudto.setDocumentoUsuario(rs.getString("documento_usuario"));
				usudto.setNacionalidadUsuario(rs.getString("nacionalidad_usuario"));
				usudto.setDireccionUsuario(rs.getString("direccion_usuario"));
				usudto.setTelefonoMovilUsuario(rs.getString("telefonomovil_usuario"));
				usudto.setTelefonoFijoUsuario(rs.getString("telefonofijo_usuario"));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select usuario: " + e.getMessage());
		}
		
		return usudto;
	}
	
	public void updateUsuario(UsuarioDTO usudto) {
		conn = conexion.ObjectPool.getConnection();
		
		try {
			String sql = "UPDATE usuario SET nombrecompleto_usuario = '" + usudto.getNombreCompletoUsuario() + 
					"', documento_usuario = '" + usudto.getDocumentoUsuario() + "', nacionalidad_usuario = '" + 
					usudto.getNacionalidadUsuario() + "', direccion_usuario = '" + usudto.getDireccionUsuario() + 
					"', telefonomovil_usuario = '" + usudto.getTelefonoMovilUsuario() + "', telefonofijo_usuario = '" + 
					usudto.getTelefonoFijoUsuario() + "' WHERE id_usuario = '" + usudto.getIdUsuario() + "'";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error update usuario: " + ex.getMessage());
		}
	}
}
