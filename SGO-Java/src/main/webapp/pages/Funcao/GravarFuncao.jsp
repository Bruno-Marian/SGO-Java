<%@page import="contollers.FuncaoController"%>
<%@page import="models.Funcao"%>
<%
	int id = 0;
	String nome = request.getParameter("nome");
	String editar = request.getParameter("editar");
	if(editar.equals("yes")){
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	Funcao f = new Funcao(id, nome);
	
	if(FuncaoController.salvar(f)){
		response.sendRedirect("ConsultarFuncao.jsp");
	}
%>