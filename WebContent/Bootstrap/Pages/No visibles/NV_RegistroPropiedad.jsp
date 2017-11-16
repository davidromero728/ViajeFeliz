<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.util.*, java.sql.*, dto.*, dao.*, conexion.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    
		<title>Viaje Feliz</title>
		
		<!-- Bootstrap Core CSS -->
	    <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Custom Fonts -->
	    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	
	    <!-- Custom CSS -->
	    <link href="../../css/stylish-portfolio.css" rel="stylesheet">	
	</head>
	
	<body>
		<section id="registrarPropiedad" class="services bg-primary text-white">
	     	<div class="row">
	           	<div class="col-lg-12 text-center">
	           		<h4>
				     	<%
				     		String region = request.getParameter("Region_propiedad");
				     		String ciudad = request.getParameter("Ciudad_propiedad");
				     		String barrio = request.getParameter("Barrio_propiedad");
				     		String direccion = request.getParameter("Direccion_propiedad");
				     		String descripcion = request.getParameter("Descripcion_propiedad");
				     		String numMaxPersonas = request.getParameter("NumMaxPersonas_propiedad");
				     		String numHabitaciones = request.getParameter("NumHabitaciones_propiedad");
				     		String numBaños = request.getParameter("NumBaños_propiedad");
				     		String calefaccion = (String) request.getParameter("comboCalefaccion");
				     		String aireAcondicionado = (String) request.getParameter("comboAireAcondicionado");
				     		String mascotas = (String) request.getParameter("comboMascotas");
				     		String precioBase = request.getParameter("PrecioBase_propiedad");
				     		String usuario = session.getAttribute("id").toString();
				     		String tipoPropiedad = (String) request.getParameter("comboTipoPropiedad");				     		
				     		
				     		if(region.isEmpty() || ciudad.isEmpty() || barrio.isEmpty() || descripcion.isEmpty() || 
				     				numMaxPersonas.isEmpty() || numHabitaciones.isEmpty() || numBaños.isEmpty() || 
				     				precioBase.isEmpty()) {
				     			out.println("Debes ingresar todos los campos <a href='../../index.html' style='color:#CCCCCC'> Intenta otra vez </a>");
				     		} else {
				     			PropiedadDAO prodao = new PropiedadDAO();
				     			PropiedadDTO prodto = prodao.selectPropiedad(region, ciudad, barrio, direccion);
				     			
				     			if(prodto.getDireccionPropiedad() == null) {
				     				prodto.setRegionPropiedad(region);
				     				prodto.setCiudadPropiedad(ciudad);
				     				prodto.setBarrioPropiedad(barrio);
				     				prodto.setDireccionPropiedad(direccion);
				     				prodto.setDescripcionPropiedad(descripcion);
				     				prodto.setNumeroMaximoPersonasPropiedad(Integer.parseInt(numMaxPersonas));
				     				prodto.setNumeroHabitacionesPropiedad(Integer.parseInt(numHabitaciones));
				     				prodto.setNumeroBañosPropiedad(Integer.parseInt(numBaños));
				     				prodto.setCalefaccionPropiedad(Integer.parseInt(calefaccion));
				     				prodto.setAireAcondicionadoPropiedad(Integer.parseInt(aireAcondicionado));
				     				prodto.setMascotasPropiedad(Integer.parseInt(mascotas));
				     				prodto.setPrecioBasePropiedad(Integer.parseInt(precioBase));
				     				prodto.setIdUsuario(Integer.parseInt(usuario));
				     				prodto.setIdTipoCasa(Integer.parseInt(tipoPropiedad));
				     				
				     				int idProp = prodao.insertPropiedad(prodto);
				     				
				     				PropiedadUsuarioDTO pudto = new PropiedadUsuarioDTO();
				     				pudto.setIdUsuario(Integer.parseInt(usuario));
				     				pudto.setIdPropiedad(idProp);
				     				
				     				PropiedadUsuarioDAO pudao = new PropiedadUsuarioDAO();
				     				pudao.insertPropiedadUsuario(pudto);
				     				
				     				out.println("Registro de la propiedad exitoso <a href='../Visibles/PropiedadesUsuario.jsp' style='color:#CCCCCC'> Regresar </a>");
				     			} else {
				     				out.println("La propiedad ya está registrada <a href='../Visibles/PropiedadesUsuario.jsp' style='color:#CCCCCC'> Intentar otra vez </a>");
				     			}
				     		}
						%>
					</h4>
	           	</div>
	        </div>
	     </section>
	</body>
</html>