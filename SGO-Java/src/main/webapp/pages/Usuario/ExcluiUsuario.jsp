<%@page import="contollers.UsuarioController"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	if(id == 1){
		response.sendRedirect("ConsultaUsuario.jsp");
		return;
	}

	if(UsuarioController.excluir(id)){
		response.sendRedirect("ConsultaUsuario.jsp");
	}
%>