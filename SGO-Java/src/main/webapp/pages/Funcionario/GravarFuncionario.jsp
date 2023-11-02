<%@page import="utils.Converters"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="contollers.FuncionarioController"%>
<%@page import="models.Funcionario"%>
<%@page import="java.sql.Date"%>
<%
	int id = 0;
	String nome = request.getParameter("nome");
	String sexo = request.getParameter("sexo");
    Date dataNascimento = Converters.DataConverter(request.getParameter("dataNascimento"));
	int funcao = Integer.parseInt(request.getParameter("funcao"));
	
	String editar = request.getParameter("editar"); 
	if(editar.equals("yes")){
		id = Integer.parseInt(request.getParameter("id"));
	}
	
	Funcionario fu = new Funcionario(id, nome, sexo, dataNascimento, funcao);
	
	if(FuncionarioController.salvar(fu)){
		response.sendRedirect("ConsultarFuncionario.jsp");
	}
%>