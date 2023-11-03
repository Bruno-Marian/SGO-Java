<%@page import="contollers.UsuarioController"%>
<%@page import="models.Usuario"%>
<%
	int id = 0;
    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("senha");
	int grupoUsuario = Integer.parseInt(request.getParameter("grupoUsuario"));
	int funcionario = Integer.parseInt(request.getParameter("funcionario"));
	String editar = request.getParameter("editar");
	if(editar.equals("yes")){
		id = Integer.parseInt(request.getParameter("id"));
	}

	Usuario usu = new Usuario(id, usuario, senha, grupoUsuario, funcionario);
	
	if(UsuarioController.salvar(usu)){
		response.sendRedirect("ConsultarUsuario.jsp");
	}
%>