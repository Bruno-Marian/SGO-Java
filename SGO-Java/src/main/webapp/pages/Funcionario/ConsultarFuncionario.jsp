<%@page import="utils.Permissoes"%>
<%@page import="models.Funcao"%>
<%@page import="contollers.FuncionarioController"%>
<%@page import="contollers.FuncaoController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultar Funcionario</title>
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<%
	if (UsuarioController.getUsuarioIdLogado() == 0) {
		response.sendRedirect("../Login/Login.jsp");
	} else if (!UsuarioController.temPermissao(Permissoes.APENAS_VISUALIZAR_TELAS_SOBRE_FUNCIONARIO) && !UsuarioController.temPermissao(Permissoes.TOTAL_TELAS_SOBRE_FUNCIONARIO)) {
		response.sendRedirect("../Menu/Menu.jsp");
	}
	%>
	<nav>
		<%@ include file="../Menu/Menu.jsp"%>
	</nav>
	<div class="caixa">
		<div class="row mb-4 p-2">
			<div class="col-md-10">
				<h3>Funcionários</h3>
			</div>
			<div class="col-md-2">
				<button class="btn btn-success float-right"
					onclick="cadastraClick()">Cadastrar</button>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Data Nascimento</th>
					<th>Função</th>
					<th>Gênero</th>
				</tr>
			</thead>
			<tbody>
				<%
				ResultSet funcionario = FuncionarioController.consultarExibir();
				while (funcionario.next()) {
					out.print("<tr>");
					out.print("<td>" + funcionario.getString("id") + "</td>");
					out.print("<td>" + funcionario.getString("nome") + "</td>");
					out.print("<td>" + funcionario.getString("data_nascimento") + "</td>");
					out.print("<td>" + funcionario.getString("funcao") + "</td>");
					out.print("<td>" + funcionario.getString("sexo") + "</td>");
					String editar = "<td><a href='EditarFuncionario.jsp?id=" + funcionario.getString("id") + "'>Editar</a>";
					String excluir = "<td><a href='ExcluirFuncionario.jsp?id=" + funcionario.getString("id") + "'>Excluir</a>";
					out.print(editar + " " + excluir);
					out.print("<tr>");
				}
				%>
			</tbody>
		</table>
	</div>
	<script>
		function cadastraClick() {
			let page = "CadastroFuncionario.jsp";
			document.body.innerHTML = '<object type="text/html" data="' + page + '"></object>';
		}
	</script>
</body>
</html>