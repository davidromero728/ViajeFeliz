package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.PreparedStatement;

import dto.PropiedadDTO;

public class PropiedadDAO {
	Connection conn;
	
	public int insertPropiedad(PropiedadDTO propiedad) {
		conn = conexion.ObjectPool.getConnection();
		
		int id = -1;
		
		try {
			String sql = "INSERT INTO propiedad (region_propiedad, ciudad_propiedad, barrio_propiedad, direccion_propiedad, "
					+ "descripcion_propiedad, numeromaximopersonas_propiedad, numerohabitaciones_propiedad, numerobaños_propiedad,"
					+ "calefaccion_propiedad, aireacondicionado_propiedad, mascotas_propiedad, preciobase_propiedad, id_usuario, "
					+ "id_tipocasa) VALUES ('" + propiedad.getRegionPropiedad() + "', '" + propiedad.getCiudadPropiedad() + "', '"
					+ propiedad.getBarrioPropiedad() + "', '" + propiedad.getDireccionPropiedad() + "', '" 
					+ propiedad.getDescripcionPropiedad() + "', '" + propiedad.getNumeroMaximoPersonasPropiedad() + "', '"
					+ propiedad.getNumeroHabitacionesPropiedad() + "', '" + propiedad.getNumeroBañosPropiedad() + "', '" 
					+ propiedad.getCalefaccionPropiedad() + "', '" + propiedad.getAireAcondicionadoPropiedad() + "', '"
					+ propiedad.getMascotasPropiedad() + "', '" + propiedad.getPrecioBasePropiedad() + "', '" 
					+ propiedad.getIdUsuario() + "', '" + propiedad.getIdTipoCasa() + "')";
			PreparedStatement stmt;
			stmt = (PreparedStatement) conn.prepareStatement(sql);
			stmt.executeUpdate();
			
			String sql2 = "SELECT last_insert_id()";
			PreparedStatement stmt2;
			stmt2 = (PreparedStatement) conn.prepareStatement(sql2);
			ResultSet rs2 = (ResultSet) stmt2.executeQuery();
						
			while(rs2.next()) {
				id = Integer.parseInt(rs2.getString("last_insert_id()"));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception ex) {
			System.out.println("Error insert propiedad: " + ex.getMessage());
		}
		
		return id;
	}
	
	public PropiedadDTO selectPropiedad(String region, String ciudad, String barrio, String direccion) {
		conn = conexion.ObjectPool.getConnection();
		
		PropiedadDTO propdto = new PropiedadDTO();
		
		try {
			String sql = "SELECT * FROM propiedad WHERE region_propiedad = '" + region + "' and ciudad_propiedad = '" 
					+ ciudad + "' and barrio_propiedad = '" + barrio + "' and direccion_propiedad = '" 
					+ direccion + "'";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				propdto.setIdPropiedad(Integer.parseInt(rs.getString("id_propiedad")));
				propdto.setRegionPropiedad(rs.getString("region_propiedad"));
				propdto.setCiudadPropiedad(rs.getString("ciudad_propiedad"));
				propdto.setBarrioPropiedad(rs.getString("barrio_propiedad"));
				propdto.setDireccionPropiedad(rs.getString("direccion_propiedad"));
				propdto.setDescripcionPropiedad(rs.getString("descripcion_propiedad"));
				propdto.setNumeroMaximoPersonasPropiedad(Integer.parseInt(rs.getString("numeromaximopersonas_propiedad")));
				propdto.setNumeroHabitacionesPropiedad(Integer.parseInt(rs.getString("numerohabitaciones_propiedad")));
				propdto.setNumeroBañosPropiedad(Integer.parseInt(rs.getString("numerobaños_propiedad")));
				propdto.setCalefaccionPropiedad(Integer.parseInt(rs.getString("calefaccion_propiedad")));
				propdto.setAireAcondicionadoPropiedad(Integer.parseInt(rs.getString("aireacondicionado_propiedad")));
				propdto.setMascotasPropiedad(Integer.parseInt(rs.getString("mascotas_propiedad")));
				propdto.setPrecioBasePropiedad(Integer.parseInt(rs.getString("preciobase_propiedad")));
				propdto.setIdUsuario(Integer.parseInt(rs.getString("id_usuario")));
				propdto.setIdTipoCasa(Integer.parseInt(rs.getString("id_tipocasa")));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select propiedad: " + e.getMessage());
		}
		
		return propdto;
	}
	
	public PropiedadDTO selectPropiedadId(String id) {
		conn = conexion.ObjectPool.getConnection();
		
		PropiedadDTO propdto = new PropiedadDTO();
		
		try {
			String sql = "SELECT * FROM propiedad WHERE id_propiedad = '" + id + "'";
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				propdto.setIdPropiedad(Integer.parseInt(rs.getString("id_propiedad")));
				propdto.setRegionPropiedad(rs.getString("region_propiedad"));
				propdto.setCiudadPropiedad(rs.getString("ciudad_propiedad"));
				propdto.setBarrioPropiedad(rs.getString("barrio_propiedad"));
				propdto.setDireccionPropiedad(rs.getString("direccion_propiedad"));
				propdto.setDescripcionPropiedad(rs.getString("descripcion_propiedad"));
				propdto.setNumeroMaximoPersonasPropiedad(Integer.parseInt(rs.getString("numeromaximopersonas_propiedad")));
				propdto.setNumeroHabitacionesPropiedad(Integer.parseInt(rs.getString("numerohabitaciones_propiedad")));
				propdto.setNumeroBañosPropiedad(Integer.parseInt(rs.getString("numerobaños_propiedad")));
				propdto.setCalefaccionPropiedad(Integer.parseInt(rs.getString("calefaccion_propiedad")));
				propdto.setAireAcondicionadoPropiedad(Integer.parseInt(rs.getString("aireacondicionado_propiedad")));
				propdto.setMascotasPropiedad(Integer.parseInt(rs.getString("mascotas_propiedad")));
				propdto.setPrecioBasePropiedad(Integer.parseInt(rs.getString("preciobase_propiedad")));
				propdto.setIdUsuario(Integer.parseInt(rs.getString("id_usuario")));
				propdto.setIdTipoCasa(Integer.parseInt(rs.getString("id_tipocasa")));
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select propiedad: " + e.getMessage());
		}
		
		return propdto;
	}
	
	public ArrayList<PropiedadDTO> selectPropiedadConsulta(ArrayList<Integer> listaId, String numPer) {
		conn = conexion.ObjectPool.getConnection();
		
		ArrayList<PropiedadDTO> listaPropiedades = new ArrayList<PropiedadDTO>();
		
		try {
			String sql = "";
			
			if(listaId.size() == 0) {
				sql = "SELECT * FROM propiedad WHERE numeromaximopersonas_propiedad >= '" + numPer + "'";
			} else {
				sql = "SELECT * FROM propiedad ";
				for(int i = 0; i < listaId.size(); i++) {
					if(i == 0) {
						sql += "WHERE id_propiedad != '" + listaId.get(i) + "' ";
					} else {
						sql += "and id_propiedad != '" + listaId.get(i) + "' ";
					}				
				}
				
				sql += "and numeromaximopersonas_propiedad >= '" + numPer + "'";
			}			
			
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			
			while(rs.next()) {
				PropiedadDTO propdto = new PropiedadDTO();
				propdto.setIdPropiedad(Integer.parseInt(rs.getString("id_propiedad")));
				propdto.setRegionPropiedad(rs.getString("region_propiedad"));
				propdto.setCiudadPropiedad(rs.getString("ciudad_propiedad"));
				propdto.setBarrioPropiedad(rs.getString("barrio_propiedad"));
				propdto.setDireccionPropiedad(rs.getString("direccion_propiedad"));
				propdto.setDescripcionPropiedad(rs.getString("descripcion_propiedad"));
				propdto.setNumeroMaximoPersonasPropiedad(Integer.parseInt(rs.getString("numeromaximopersonas_propiedad")));
				propdto.setNumeroHabitacionesPropiedad(Integer.parseInt(rs.getString("numerohabitaciones_propiedad")));
				propdto.setNumeroBañosPropiedad(Integer.parseInt(rs.getString("numerobaños_propiedad")));
				propdto.setCalefaccionPropiedad(Integer.parseInt(rs.getString("calefaccion_propiedad")));
				propdto.setAireAcondicionadoPropiedad(Integer.parseInt(rs.getString("aireacondicionado_propiedad")));
				propdto.setMascotasPropiedad(Integer.parseInt(rs.getString("mascotas_propiedad")));
				propdto.setPrecioBasePropiedad(Integer.parseInt(rs.getString("preciobase_propiedad")));
				propdto.setIdUsuario(Integer.parseInt(rs.getString("id_usuario")));
				propdto.setIdTipoCasa(Integer.parseInt(rs.getString("id_tipocasa")));
				
				listaPropiedades.add(propdto);
			}
			
			conexion.ObjectPool.releaseConnection(conn);
		} catch (Exception e) {
			System.out.println("Error select propiedad consulta: " + e.getMessage());
		}
		
		return listaPropiedades;
	}
}
