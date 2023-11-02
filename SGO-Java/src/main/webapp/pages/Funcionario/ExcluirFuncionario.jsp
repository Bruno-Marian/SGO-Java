<%@page import="contollers.FuncionarioController"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	if (FuncionarioController.excluir(id)){
		response.sendRedirect("ConsultarFuncionario.jsp");
	}
%>