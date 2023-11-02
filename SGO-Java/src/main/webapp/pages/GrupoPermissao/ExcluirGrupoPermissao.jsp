<%@page import="contollers.GrupoPermissaoController"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	if (GrupoPermissaoController.excluir(id)){
		response.sendRedirect("ConsultarGrupoPermissao.jsp");
	}
%>