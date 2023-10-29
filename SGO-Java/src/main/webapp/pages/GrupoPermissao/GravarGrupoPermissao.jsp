<%@page import="contollers.GrupoPermissaoController"%>
<%@page import="models.GrupoPermissao"%>
<%
	int id = 0;
	int grupoUsuario = Integer.parseInt(request.getParameter("grupoUsuario"));
	int permissaoUsuario = Integer.parseInt(request.getParameter("permissaoUsuario"));
	String editar = request.getParameter("editar");
	if(editar.equals("yes")){
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	GrupoPermissao gu = new GrupoPermissao(id, permissaoUsuario, grupoUsuario);
	
	if(GrupoPermissaoController.salvar(gu)){
		response.sendRedirect("ConsultarGrupoPermissao.jsp");
	}
%>