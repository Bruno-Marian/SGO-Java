<%@page import="contollers.UsuarioController"%>
<%@page import="models.Usuario"%>
<%
    String login = request.getParameter("login");
    String senha = request.getParameter("senha");
	
	if(UsuarioController.ExisteUsuarioSenha(login, senha)){
		response.sendRedirect("../Menu/Menu.jsp");
	}else{
		response.sendRedirect("Login.jsp");	
	}
%>