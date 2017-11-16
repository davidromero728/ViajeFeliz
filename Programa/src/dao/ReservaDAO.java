package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import dto.ReservaDTO;

public class ReservaDAO {
	Connection conn;
	
	public void insertReserva(ReservaDTO reserva) {
		conn = conexion.ObjectPool.getConnection();
		
		try {
			String sql = "INSERT INTO reserva (abono_reserva, fechainicio_reserva, fechafin_reserva, numeropersonas_reserva, "
					+ "mascotas_reserva, preciototal_reserva, alquiler_reserva, id_usuario, id_propiedad, id_temporada) VALUES ('" 
					+ reserva.getAbonoReserva() + "', '" + reserva.getFechaInicioReserva() + "', '" + reserva.getFechaFinReserva()
					+ "', '" + reserva.getNumeroPersonasReserva() + "', '" + reserva.isMascotasReserva() + "', '" 
					+ reserva.getPrecioTotalReserva() + "', '" + reserva.isAlquilerReserva() + "', '" + reserva.getIdUsuario()
					+ "', '" + reserva.getIdPropiedad() + "', '" + reserva.getIdTemporada() + "')";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error insert reserva: " + ex.getMessage());
		}
	}
	
	public ReservaDTO selectReserva(String res) {
		conn = conexion.ObjectPool.getConnection();
		
		ReservaDTO resdto = new ReservaDTO();
		
		try {
			String sql = "SELECT * FROM reserva WHERE id_reserva = '" + res + "'";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				resdto.setIdReserva(Integer.parseInt(rs.getString("id_reserva")));
				resdto.setAbonoReserva(Integer.parseInt(rs.getString("abono_reserva")));
				resdto.setFechaInicioReserva(Date.valueOf(rs.getString("fechainicio_reserva")));
				resdto.setFechaFinReserva(Date.valueOf(rs.getString("fechafin_reserva")));
				resdto.setNumeroPersonasReserva(Integer.parseInt(rs.getString("numeropersonas_reserva")));
				resdto.setMascotasReserva(Boolean.valueOf(rs.getString("mascotas_reserva")));
				resdto.setPrecioTotalReserva(Integer.parseInt(rs.getString("preciototal_reserva")));
				resdto.setAlquilerReserva(Boolean.valueOf(rs.getString("alquiler_reserva")));
				resdto.setIdUsuario(Integer.parseInt(rs.getString("id_usuario")));
				resdto.setIdPropiedad(Integer.parseInt(rs.getString("id_propiedad")));
				resdto.setIdTemporada(Integer.parseInt(rs.getString("id_temporada")));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select reserva: " + e.getMessage());
		}
		
		return resdto;
	}
	
	public ArrayList<Integer> selectReservaConsultar(String fechaInicio, String fechaFin) {
		conn = conexion.ObjectPool.getConnection();
		
		ArrayList<Integer> listaProp = new ArrayList<Integer>();
		
		try {
			String sql = "SELECT id_propiedad FROM reserva WHERE fechainicio_reserva between '" + fechaInicio + "' and '" 
					+ fechaFin + "' or fechafin_reserva between '" + fechaInicio + "' and '" + fechaFin + "' group by id_propiedad";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {			
				listaProp.add(Integer.parseInt(rs.getString("id_propiedad")));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select reserva consulta: " + e.getMessage());
		}
		
		return listaProp;
	}
}
