<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="contollers.UsuarioController"%>
<%@page import="contollers.FuncionarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Usuário</title>
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
				<h3>Usuários</h3>
			</div>
			<div class="col-md-2">
				<button class="btn btn-success float-right"
					onclick="cadastraClick()">Cadastrar</button>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Login</th>
					<th>Grupo de Usuário</th>
					<th>Funcionário</th>
				</tr>
			</thead>
			<tbody>
				<%
				ResultSet usuario = UsuarioController.consultar();
				while (usuario.next()) {
					out.print("<tr>");
					out.print("<td>" + usuario.getString("id") + "</td>");
					out.print("<td>" + usuario.getString("login") + "</td>");
					out.print("<td>" + GrupoUsuarioController.consultar(usuario.getInt("grupo_usuario")).getAcao() + "</td>");
					out.print("<td>" + FuncionarioController.consultar(usuario.getInt("funcionario")).getNome() + "</td>");
					String editar = "<td><a href='EditarUsuario.jsp?id=" + usuario.getString("id") + "'>Editar</a>";
					String excluir = "<td><a href='ExcluirUsuario.jsp?id=" + usuario.getString("id") + "'>Excluir</a>";
					out.print(editar + " " + excluir);
					out.print("<tr>");
				}
				%>
			</tbody>
		</table>
	</div>
	<script>
		function cadastraClick() {
			let page = "CadastroUsuario.jsp";
			document.body.innerHTML = '<object type="text/html" data="' + page + '"></object>';
		}
	</script>
</body>
</html>