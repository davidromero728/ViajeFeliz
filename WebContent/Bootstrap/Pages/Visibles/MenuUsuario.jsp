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
		<!-- Navigation -->
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
		       	  	<a class="js-scroll-trigger" href="#consultar">Consultar</a>
		        </li>
		        <li class="sidebar-brand">
		       	  	<a class="js-scroll-trigger" href="#verReservas">Mis reservas</a>
		        </li>
		        <li class="sidebar-brand">
		       	  	<a class="js-scroll-trigger" href="#verPropiedades">Mis propiedades</a>
		        </li>
		        <li class="sidebar-brand">
		       	  	<a class="js-scroll-trigger" href="#historial">Historial</a>
		        </li>
	      	</ul>
	    </nav>
	    
	    <!-- Header -->
    	<header class="header" id="top">
     		<div class="text-vertical-center">
        		<h1> BIENVENIDO </h1>
        		<h2>
        			<%
        				out.println(session.getAttribute("nick"));
        			%>
        		</h2>        		
     		</div>
    	</header>
	    
	    <section id="consultar" class="services bg-primary text-white">
	    	<form name="datosConsulta" id="sesionForm" action="ListaConsulta.jsp" method="post">
		    	<div class="row">
	            	<div class="col-lg-12 text-center">
	             		<h4> CONSULTA UNA PROPIEDAD	</h4>
	             	</div>
	            </div>
	            <div class="row">
	            	<div class="col-lg-12 text-center">
	            		<label>
	               			Fecha de inicio (AAAA-MM-DD): <input type="text" name="FechaInicio_consulta">  
	               		</label>
	               		<br>
	               		<label>
		               		Fecha final (AAAA-MM-DD): <input type="text" name="FechaFin_consulta" >  
	               		</label>
	               		<br>
	               		<label>
		               		Número de personas: <input type="text" name="NumPersonas_consulta" >  
	               		</label>
	          		</div>  
	            </div>
	            <div id="success">
            		<div class="row">
               			<div class="col-lg-12 text-center">
                   			<button  type="submit" class="btn btn-dark btn-lg js-scroll-trigger">Consultar</button>
          				</div>
          			</div>
          			<ul>
						<input type="hidden" value="consultar" name="accion"/>
					</ul>
				</div>
	     	</form>
		</section>
	     
		<section id="verReservas" class="services bg-primary text-white">
	    	<form name="datosReservasUsuario" id="sesionForm" action="PropiedadesUsuario.jsp" method="post">
	    		<div class="row">
	            	<div class="col-lg-12 text-center">
	             		<h4> MIS RESERVAS </h4>
	             	</div>
	            </div>		     	
	            <div id="success">
            		<div class="row">
               			<div class="col-lg-12 text-center">
                   			<button  type="submit" class="btn btn-dark btn-lg js-scroll-trigger">Mis reservas</button>
          				</div>
          			</div>
          			<ul>
						<input type="hidden" value="consultar" name="accion"/>
					</ul>
				</div>
	     	</form>
		</section>
		
		<section id="verPropiedades" class="services bg-primary text-white">
	    	<form name="datosPropiedades" id="sesionForm" action="PropiedadesUsuario.jsp" method="post">
	    		<div class="row">
	            	<div class="col-lg-12 text-center">
	             		<h4> MIS PROPIEDADES </h4>
	             	</div>
	            </div>		     	
	            <div id="success">
            		<div class="row">
               			<div class="col-lg-12 text-center">
                   			<button  type="submit" class="btn btn-dark btn-lg js-scroll-trigger">Mis propiedades</button>
          				</div>
          			</div>
          			<ul>
						<input type="hidden" value="consultar" name="accion"/>
					</ul>
				</div>
	     	</form>
		</section>
	    
	    <section id="historial" class="services bg-primary text-white">
	    	<form name="datosReservasUsuario" id="sesionForm" action="Pages/No visibles/Conexion.jsp" method="post">
	    		<div class="row">
	            	<div class="col-lg-12 text-center">
	             		<h4> HISTORIAL </h4>
	             	</div>
	            </div>		     	
	            <div id="success">
            		<div class="row">
               			<div class="col-lg-12 text-center">
                   			<button  type="submit" class="btn btn-dark btn-lg js-scroll-trigger">Historial</button>
          				</div>
          			</div>
          			<ul>
						<input type="hidden" value="consultar" name="accion"/>
					</ul>
				</div>
	     	</form>
		</section>
	    
	    <!-- jQuery -->
    	<script src="../../vendor/jquery/jquery.min.js"></script>
		
		<!-- Bootstrap core JavaScript -->
	    <script src="../../vendor/jquery/jquery.min.js"></script>
	    <script src="../../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	    <!-- Plugin JavaScript -->
	    <script src="../../vendor/jquery-easing/jquery.easing.min.js"></script>
	
	    <!-- Custom scripts for this template -->
	    <script src="../../js/stylish-portfolio.js"></script>
	</body>
</html>