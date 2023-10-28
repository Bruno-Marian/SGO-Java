<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="models.GrupoUsuario"%>
<%
	int id = 0;
	String acao = request.getParameter("acao");
	String observacao = request.getParameter("observacao");
	String editar = request.getParameter("editar");
	if(editar.equals("yes")){
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	GrupoUsuario gu = new GrupoUsuario(id, acao, observacao);
	
	if(GrupoUsuarioController.salvar(gu)){
		response.sendRedirect("ConsultaGrupoUsuario.jsp");
	}
%>