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
		       	  	<a class="js-scroll-trigger" href="#lista">Lista de resultados</a>
		        </li>		        
	      	</ul>
	    </nav>
	    
	    <!-- Header -->
    	<header class="header" id="top">
     		<div class="text-vertical-center">
        		<h1> RESULTADOS </h1>       		
     		</div>
    	</header>
    	
    	<section id="lista" class="services bg-primary text-white">
    		<div class="col-lg-12 text-center">
    			<ul class="list-inline">
    				<li>
    					<%
    						String fechaInicio = request.getParameter("FechaInicio_consulta");
    						String fechaFin = request.getParameter("FechaFin_consulta");
    						String numeroPersonas = request.getParameter("NumPersonas_consulta");    						
    						
    						if(fechaInicio.toString().isEmpty() || fechaFin.toString().isEmpty() || numeroPersonas.isEmpty()) {
    							out.println("Se deben ingresar todos los campos <a href='MenuUsuario.jsp' style='color:#CCCCCC'> Intenta otra vez </a>");
    						} else {
    							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    							Calendar cal = Calendar.getInstance();
        						cal.add(Calendar.DATE, 1);
        						String fechaActual = sdf.format(cal.getTime());
        						
        						java.util.Date dateInicio = sdf.parse(fechaInicio);
        						java.util.Date dateFin = sdf.parse(fechaFin);
        						java.util.Date dateActual = sdf.parse(fechaActual);
    							
    							if(dateInicio.before(dateFin)) {
        							if(dateInicio.after(dateActual)) {
        								
        							ReservaDAO resdao = new ReservaDAO();
        							ArrayList<Integer> lisPropRes = resdao.selectReservaConsultar(fechaInicio, fechaFin);
        						
        							PropiedadDAO prodao = new PropiedadDAO();
        							ArrayList<PropiedadDTO> listaProp = prodao.selectPropiedadConsulta(lisPropRes, numeroPersonas);
        						
        							if(listaProp.size() == 0) {   						
    					%>
    					<p> NO HAY LUGARES DISPONIBLES </p>    					
    					<%
    							} else {
    								for(int i = 0; i < listaProp.size(); i++) {    							
    					%>
    					<p>
    						<a href="DetallesPropiedad.jsp?idPropiedad=<%=listaProp.get(i).getIdPropiedad()%>" style="color:#FFFFFF">
    							<%=listaProp.get(i).getCiudadPropiedad() %>
    							<%
    								session.setAttribute("idPropiedad", listaProp.get(i).getIdPropiedad()); 
    							%>
    						</a>
    					</p>
    					<%	
	    									}
	    								}     						
	    							} else {
										out.println("La fecha inicial debe ser posterior a la fecha actual <a href='MenuUsuario.jsp' style='color:#CCCCCC'> Intenta otra vez </a>");
									}
								} else {
									out.println("La fecha final debe ser posterior a la fecha inicial <a href='MenuUsuario.jsp' style='color:#CCCCCC'> Intenta otra vez </a>");
								}	
    						}    					
    					%>
    				</li>
    			</ul>
    		</div>
    	</section>
	</body>
</html>