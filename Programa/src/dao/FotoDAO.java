package dao;

import java.sql.Connection;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

import dto.FotoDTO;

public class FotoDAO {
	Connection conn;
	
	public void insertFoto(FotoDTO foto) {
		conn = conexion.ObjectPool.getConnection();
		
		try {
			String sql = "INSERT INTO foto (url_foto, id_propiedad) VALUES ('" + foto.getUrlFoto() + 
					"', '" + foto.getIdPropiedad() + "')";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error insert foto: " + ex.getMessage());
		}
	}
	
	public FotoDTO selectFoto(String foto) {
		conn = conexion.ObjectPool.getConnection();
		
		FotoDTO fotodto = new FotoDTO();
		
		try {
			String sql = "SELECT * FROM foto WHERE id_foto = '" + foto + "'";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				fotodto.setIdFoto(Integer.parseInt(rs.getString("id_foto")));
				fotodto.setUrlFoto(rs.getString("url_foto"));
				fotodto.setIdPropiedad(Integer.parseInt(rs.getString("id_propriedad")));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select foto: " + e.getMessage());
		}
		
		return fotodto;
	}	
}
