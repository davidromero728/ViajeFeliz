package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import dto.TipoCasaDTO;

public class TipoCasaDAO {
	Connection conn;
	
	public void insertTipoCasa(TipoCasaDTO tc) {
		conn = conexion.ObjectPool.getConnection();
		
		try {
			String sql = "INSERT INTO tipocasa (nombre_tipocasa) VALUES ('" + tc.getNombreTipoCasa()  + "')";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error insert tipoCasa: " + ex.getMessage());
		}
	}
	
	public ArrayList<TipoCasaDTO> selectTipoCasa() {
		conn = conexion.ObjectPool.getConnection();
		
		ArrayList<TipoCasaDTO> listaTipoCasa = new ArrayList<TipoCasaDTO>();
		
		try {
			String sql = "SELECT * FROM tipocasa ";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				TipoCasaDTO tcdto = new TipoCasaDTO();
				tcdto.setIdTipoCasa(Integer.parseInt(rs.getString("id_tipocasa")));
				tcdto.setNombreTipoCasa(rs.getString("nombre_tipocasa"));
				
				listaTipoCasa.add(tcdto);
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select tipoCasa: " + e.getMessage());
		}
		
		return listaTipoCasa;
	}
}
