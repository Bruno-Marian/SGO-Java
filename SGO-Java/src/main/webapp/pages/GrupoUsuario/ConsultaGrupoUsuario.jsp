<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultar Grupo de Usuários</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
</head>
<body>
<%
	if (UsuarioController.getUsuarioIdLogado() == 0) {
		response.sendRedirect("../Login/Login.jsp");
	} else if (!UsuarioController.temPermissao("VISUALIZAR TABELA PERMISSAO USUARIO")) {
		response.sendRedirect("../Menu/Menu.jsp");
	}
	%>
	<nav>
		<%@ include file="../Menu/Menu.jsp"%>
	</nav>
	<div class="caixa">
		<div class="row mb-4 p-2">
			<div class="col-md-10">
				<h3>Grupo de Usuários</h3>
			</div>
			<div class="col-md-2">
				<button class="btn btn-success float-right"
					onclick="cadastraClick()">Cadastrar</button>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Ação</th>
					<th>Observação</th>
				</tr>
			</thead>
			<tbody>
				<%
				ResultSet grupoUsuarios = GrupoUsuarioController.consultar();
				while (grupoUsuarios.next()) {
					out.print("<tr>");
					out.print("<td>" + grupoUsuarios.getString("id") + "</td>");
					out.print("<td>" + grupoUsuarios.getString("acao") + "</td>");
					out.print("<td>" + grupoUsuarios.getString("observacao") + "</td>");
					String editar = "<td><a href='EditarGrupoUsuario.jsp?id=" + grupoUsuarios.getString("id") + "'>Editar</a>";
					String excluir = "<td><a href='ExcluirGrupoUsuario.jsp?id=" + grupoUsuarios.getString("id") + "'>Excluir</a>";
					out.print(editar + " " + excluir);
					out.print("<tr>");
				}
				%>
			</tbody>
		</table>
	</div>
	<script>
		function cadastraClick() {
			let page = "CadastroGrupoUsuario.jsp";
			document.body.innerHTML = '<object type="text/html" data="' + page + '"></object>';
		}
	</script>
</body>
</html>