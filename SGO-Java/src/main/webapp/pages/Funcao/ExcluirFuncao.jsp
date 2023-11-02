<%@page import="contollers.FuncaoController"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	if (FuncaoController.excluir(id)){
		response.sendRedirect("ConsultarFuncao.jsp");
	}
%>