package dao;

import java.sql.Connection;
import java.sql.ResultSet;

import com.mysql.jdbc.PreparedStatement;

import dto.TemporadaDTO;

public class TemporadaDAO {
	Connection conn;
	
	public void insertTemporada(TemporadaDTO temp) {
		conn = conexion.ObjectPool.getConnection();
		
		try {
			String sql = "INSERT INTO temporada (nombre_temporada, fechainicio_temporada, fechafin_temporada) VALUES ('" 
					+ temp.getNombreTemporada() + "')";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error insert temporada: " + ex.getMessage());
		}
	}
	
	public TemporadaDTO selectTemporada(String temp) {
		conn = conexion.ObjectPool.getConnection();
		
		TemporadaDTO tempdto = new TemporadaDTO();
		
		try {
			String sql = "SELECT * FROM temporada WHERE id_temporada = '" + temp + "'";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				tempdto.setIdTemporada(Integer.parseInt(rs.getString("id_temporada")));
				tempdto.setNombreTemporada(rs.getString("nombre_temporada"));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select temporada: " + e.getMessage());
		}
		
		return tempdto;
	}
}
