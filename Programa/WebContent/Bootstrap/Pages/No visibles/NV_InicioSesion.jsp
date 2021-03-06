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
		<section id="comprobar" class="services bg-primary text-white">
	     	<div class="row">
	           	<div class="col-lg-12 text-center">
	           		<h4>
				     	<%
				     		String usuario = request.getParameter("Nick_usuario");
				     		String clave = request.getParameter("Clave_usuario");
							UsuarioDAO usudao = new UsuarioDAO();
							UsuarioDTO usudto = usudao.selectUsuario(usuario);
							
							if(usuario.isEmpty() || clave.isEmpty()) {
								out.println("Debes ingresar todos los campos <a href='../../index.html' style='color:#CCCCCC'> Intenta otra vez </a>");
							} else {
								if(usudto.getNickUsuario() != null) {
									if(usudto.getClaveUsuario().toString().equals(clave)) {
										HttpSession sesion = request.getSession(true);
										sesion.setAttribute("nick", usudto.getNickUsuario());
										sesion.setAttribute("id", usudto.getIdUsuario());
										
										response.sendRedirect("../Visibles/MenuUsuario.jsp");
									} else {
										out.println("Contrase�a inv�lida <a href='../../index.html' style='color:#CCCCCC'> Intenta otra vez </a>");
									}
								} else {
									out.println("Usuario inv�lido <a href='../../index.html' style='color:#CCCCCC'> Intenta otra vez </a>");
								}
							}														
						%>
					</h4>
	           	</div>
	        </div>
	     </section>
	</body>
</html>