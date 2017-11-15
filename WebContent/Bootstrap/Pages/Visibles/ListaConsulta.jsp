<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        		<h1> BIENVENIDO </h1>
        		<h2>
        			<%
        				out.println(session.getAttribute("nick"));
        			%>
        		</h2>        		
     		</div>
    	</header>
    	
    	<section id="lista" class="services bg-primary text-white">
    		<div class="col-lg-12 text-center">
    			<ul class="list-inline">
    				<li>
    					<%
    						
    					%>
    				</li>
    			</ul>
    		</div>
    	</section>
	</body>
</html>