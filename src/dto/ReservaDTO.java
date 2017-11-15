package dto;

import java.sql.Date;

public class ReservaDTO {
	int idReserva;
	int abonoReserva;
	Date fechaInicioReserva;
	Date fechaFinReserva;
	int numeroPersonasReserva;
	boolean mascotasReserva;
	int precioTotalReserva;
	boolean alquilerReserva;
	int idUsuario;
	int idPropiedad;
	int idTemporada;
	
	public int getIdReserva() {
		return idReserva;
	}
	
	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}
	
	public int getAbonoReserva() {
		return abonoReserva;
	}
	
	public void setAbonoReserva(int abonoReserva) {
		this.abonoReserva = abonoReserva;
	}
	
	public Date getFechaInicioReserva() {
		return fechaInicioReserva;
	}
	
	public void setFechaInicioReserva(Date fechaInicioReserva) {
		this.fechaInicioReserva = fechaInicioReserva;
	}
	
	public Date getFechaFinReserva() {
		return fechaFinReserva;
	}
	
	public void setFechaFinReserva(Date fechaFinReserva) {
		this.fechaFinReserva = fechaFinReserva;
	}
	
	public int getNumeroPersonasReserva() {
		return numeroPersonasReserva;
	}
	
	public void setNumeroPersonasReserva(int numeroPersonasReserva) {
		this.numeroPersonasReserva = numeroPersonasReserva;
	}
	
	public boolean isMascotasReserva() {
		return mascotasReserva;
	}
	
	public void setMascotasReserva(boolean mascotasReserva) {
		this.mascotasReserva = mascotasReserva;
	}
	
	public int getPrecioTotalReserva() {
		return precioTotalReserva;
	}
	
	public void setPrecioTotalReserva(int precioTotalReserva) {
		this.precioTotalReserva = precioTotalReserva;
	}
	
	public boolean isAlquilerReserva() {
		return alquilerReserva;
	}
	
	public void setAlquilerReserva(boolean alquilerReserva) {
		this.alquilerReserva = alquilerReserva;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}
	
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	
	public int getIdPropiedad() {
		return idPropiedad;
	}
	
	public void setIdPropiedad(int idPropiedad) {
		this.idPropiedad = idPropiedad;
	}
	
	public int getIdTemporada() {
		return idTemporada;
	}
	
	public void setIdTemporada(int idTemporada) {
		this.idTemporada = idTemporada;
	}
}