package dto;

import java.sql.Date;

public class TemporadaDTO {
	int idTemporada;
	String nombreTemporada;
	Date fechaInicioTemporada;
	Date fechaFinTemporada;
	
	public int getIdTemporada() {
		return idTemporada;
	}
	
	public void setIdTemporada(int idTemporada) {
		this.idTemporada = idTemporada;
	}
	
	public String getNombreTemporada() {
		return nombreTemporada;
	}
	
	public void setNombreTemporada(String nombreTemporada) {
		this.nombreTemporada = nombreTemporada;
	}
	
	public Date getFechaInicioTemporada() {
		return fechaInicioTemporada;
	}
	
	public void setFechaInicioTemporada(Date fechaInicioTemporada) {
		this.fechaInicioTemporada = fechaInicioTemporada;
	}
	
	public Date getFechaFinTemporada() {
		return fechaFinTemporada;
	}
	
	public void setFechaFinTemporada(Date fechaFinTemporada) {
		this.fechaFinTemporada = fechaFinTemporada;
	}	
}