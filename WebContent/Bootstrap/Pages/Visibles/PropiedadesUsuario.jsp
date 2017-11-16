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
		       	  	<a class="js-scroll-trigger" href="#listaPropiedades">Mis propiedades</a>
		        </li>
		        <li class="sidebar-brand">
		       	  	<a class="js-scroll-trigger" href="#nuevaPropiedad">Nueva propiedad</a>
		        </li>
		        <li class="sidebar-brand">
	      	</ul>
	    </nav>
	    
	    <!-- Header -->
    	<header class="header" id="top">
     		<div class="text-vertical-center">
        		<h1> MIS PROPIEDADES </h1>        		
     		</div>
    	</header>
	    
	    <section id="listaPropiedades" class="services bg-primary text-white">
	    	<div class="row">
	           	<div class="col-lg-12 text-center">
	           		<h1>MIS PROPIEDADES</h1>
	           	</div>
			</div>	           	
			<div class="col-lg-12 text-center">
				<ul class="list-inline">					
					<li>
						<%
							String id = session.getAttribute("id").toString();
							PropiedadUsuarioDAO prousudao = new PropiedadUsuarioDAO();
							ArrayList<PropiedadUsuarioDTO> listaPropiedades = prousudao.selectPropiedadUsuario(id);								
							PropiedadDAO prodao = new PropiedadDAO();
								
							for(int i = 0; i < listaPropiedades.size(); i++) {
								PropiedadDTO prodto = prodao.selectPropiedadId(String.valueOf(listaPropiedades.get(i).getIdPropiedad()));
						%>
							<h3>
								<% out.println(prodto.getCiudadPropiedad() + " | " + prodto.getBarrioPropiedad() 
									+ " | " + prodto.getDireccionPropiedad() + " | " + prodto.getDescripcionPropiedad()); %>																	
							</h3>
						<% } %>
					</li>
				</ul>
			</div>
		</section>
	     
		<section id="nuevaPropiedad" class="services bg-primary text-white">
	    	<form name="datosReservasUsuario" id="sesionForm" action="../No visibles/NV_RegistroPropiedad.jsp" method="post">
	    		<div class="row">
	            	<div class="col-lg-12 text-center">
	             		<h4> AGREGAR PROPIEDAD </h4>
	             	</div>
	            </div>
	            <div class="row">
	            	<div class="col-lg-12 text-center">
	            		<label>
	               			Region: <input type="text" name="Region_propiedad">  
	               		</label>
	               		<br>
	               		<label>
		               		Ciudad: <input type="text" name="Ciudad_propiedad" >  
	               		</label>
	               		<br>
	               		<label>
		               		Barrio: <input type="text" name="Barrio_propiedad" >  
	               		</label>
	               		<br>
	               		<label>
		               		Dirección: <input type="text" name="Direccion_propiedad" >  
	               		</label>
	               		<br>
	               		<label>
		               		Descripción: <input type="text" name="Descripcion_propiedad" >  
	               		</label>
	               		<br>
	               		<label>
		               		Número máximo de personas: <input type="text" name="NumMaxPersonas_propiedad" >  
	               		</label>	               		
	               		<br>
	               		<label>
		               		Número de habitaciones: <input type="text" name="NumHabitaciones_propiedad" >  
	               		</label>
	               		<br>
	               		<label>
		               		Número de baños: <input type="text" name="NumBaños_propiedad" >  
	               		</label>
	               		<br>
	               		<label> Calefacción: 
	               			<select name="comboCalefaccion">
	               				<option value="0">
	               					No
	               				</option>
	               				<option value="1">
		               				Si
		               			</option>
	    	           		</select>
	               		</label>	               			               		
	               		<br>
	               		<label> Aire acondicionado: 
	               			<select name="comboAireAcondicionado">
	               				<option value="0">
	               					No
	               				</option>
	               				<option value="1">
	               					Si
	               				</option>
	               			</select>
	               		</label>
	               		<br>
	               		<label> Acepta mascotas: 
	               			<select name="comboMascotas">
	               				<option value="0">
	               					No
	               				</option>
	               				<option value="1">
	               					Si
	               				</option>
	               			</select>
	               		</label>
	               		<br>
	               		<label>
		               		Precio base: <input type="text" name="PrecioBase_propiedad" >  
	               		</label>
	               		<br>	               		
	               		<label> Tipo de propiedad: 
	               			<%
	               				TipoCasaDAO tcdao = new TipoCasaDAO();
	               				ArrayList<TipoCasaDTO> listaTipoCasa = tcdao.selectTipoCasa();
	               			%>
	               			<select name="comboTipoPropiedad">
	               				<%
	               					for(int i = 0; i < listaTipoCasa.size(); i++) {
	               				%>
	               				<option value="<%=listaTipoCasa.get(i).getIdTipoCasa()%>">
	               					<%out.println(listaTipoCasa.get(i).getNombreTipoCasa().toString()); %>
	               				</option>
	               				<%} %>
	               			</select>
	               		</label>
	          		</div>  
	            </div>
	            <div id="success">
            		<div class="row">
               			<div class="col-lg-12 text-center">
                   			<button  type="submit" class="btn btn-dark btn-lg js-scroll-trigger">Continuar</button>
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