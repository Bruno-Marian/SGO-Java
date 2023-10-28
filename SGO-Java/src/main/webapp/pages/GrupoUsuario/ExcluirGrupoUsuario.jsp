<%@page import="contollers.GrupoUsuarioController"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	if(id == 1){
		response.sendRedirect("ConsultaGrupoUsuario.jsp");
		return;
	}

	if(GrupoUsuarioController.excluir(id)){
		response.sendRedirect("ConsultaGrupoUsuario.jsp");
	}
%>