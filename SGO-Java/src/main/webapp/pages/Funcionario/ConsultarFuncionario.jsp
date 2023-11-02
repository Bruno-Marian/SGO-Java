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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<header class="mt-4">
		<h1 class="text-center">Consultar Funcionario</h1>
	</header>
	<nav></nav>
	<main class="p-4">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Data Nascimento</th>
					<th>Funcão</th>
					<th>Sexo</th>
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
	</main>
</body>
</html>