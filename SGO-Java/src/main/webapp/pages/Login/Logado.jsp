<%@page import="contollers.UsuarioController"%>
<%@page import="models.Usuario"%>
<%
	if(UsuarioController.getUsuarioIdLogado() != 0){
		response.sendRedirect("../Menu/Menu.jsp");
	}else{
		response.sendRedirect("Login.jsp");	
	}
%>