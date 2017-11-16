<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.text.*, java.util.*, java.sql.*, dto.*, dao.*, conexion.*"%>
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
		<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle">
	    	<i class="fa fa-bars"></i>
	    </a>
	    <nav id="sidebar-wrapper">
	      	<ul class="sidebar-nav">
		        <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle">
		          	<i class="fa fa-times"></i>
		        </a>
		        <li class="sidebar-brand">
		          	<a class="js-scroll-trigger" href="#top">Viaje Feliz</a>
		        </li>
		        <li class="sidebar-brand">
		       	  	<a class="js-scroll-trigger" href="#detalles">Detalles de la propiedad</a>
		        </li>		        
	      	</ul>
	    </nav>
	    
	    <!-- Header -->
    	<header class="header" id="top">
     		<div class="text-vertical-center">
        		<h1> DETALLES DE LA PROPIEDAD </h1>        		
     		</div>
    	</header>
    	
    	<section id="detalles" class="services bg-primary text-white">
	    	<div class="row">
			</div>	           	
			<div class="col-lg-12 text-center">
				<ul class="list-inline">
					<li>
						<%
							String idPropiedad = request.getParameter("idPropiedad");
							PropiedadDAO prodao = new PropiedadDAO();
							PropiedadDTO prodto = prodao.selectPropiedadId(idPropiedad);							
						%>						
						<p>REGIÓN: <%out.println(prodto.getRegionPropiedad()); %></p>
						<p>CIUDAD: <%out.println(prodto.getCiudadPropiedad()); %></p>
						<p>BARRIO: <%out.println(prodto.getBarrioPropiedad()); %></p>
						<p>DIRECCIÓN: <%out.println(prodto.getDireccionPropiedad()); %></p>
						<p>DESCRIPCIÓN: <%out.println(prodto.getDescripcionPropiedad()); %></p>
						<p>NÚMERO MÁXIMO DE PERSONAS: <%out.println(prodto.getNumeroMaximoPersonasPropiedad()); %></p>
						<p>NÚMERO DE HABITACIONES: <%out.println(prodto.getNumeroHabitacionesPropiedad()); %></p>
						<p>NÚMERO DE BAÑOS: <%out.println(prodto.getNumeroBañosPropiedad()); %></p>
						<p>CALEFACCIÓN: 
							<%
								if(prodto.getCalefaccionPropiedad() == 0) {
									out.println("No");
								} else {
									out.println("Si");
								} 
							%>
						</p>
						<p>AIRE ACONDICIONADO: 
							<%
								if(prodto.getAireAcondicionadoPropiedad() == 0) {
									out.println("No");
								} else {
									out.println("Si");
								} 
							%>
						</p>
						<p>ACEPTA MASCOTAS: 
							<%
								if(prodto.getMascotasPropiedad() == 0) {
									out.println("No");
								} else {
									out.println("Si");
								} 
							%>
						</p>
						<p>PRECIO BASE (DIARIO): <%out.println(prodto.getPrecioBasePropiedad()); %></p>
						<p>TIPO DE PROPIEDAD: 
							<%
								if(prodto.getIdTipoCasa() == 1) {
									out.println("Casa");
								} else {
									out.println("Cabaña");
								} 
							%>
						</p>
					</li>
				</ul>
			</div>
		</section>	
	</body>
</html>