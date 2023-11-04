<%@page import="utils.Permissoes"%>
<%@page import="contollers.GrupoPermissaoController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultar Grupo de Permissão</title>
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
	} else if (!UsuarioController.temPermissao(Permissoes.APENAS_VISUALIZAR_TELAS_SOBRE_GRUPO_PERMISSAO) && !UsuarioController.temPermissao(Permissoes.TOTAL_TELAS_SOBRE_GRUPO_PERMISSAO)) {
		response.sendRedirect("../Menu/Menu.jsp");
	}
	%>
	<nav>
		<%@ include file="../Menu/Menu.jsp"%>
	</nav>
	<div class="caixa">
		<div class="row mb-4 p-2">
			<div class="col-md-10">
				<h3>Grupo de Permissão</h3>
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
					<th>Permissão</th>
					<th>Grupo Usuário</th>
				</tr>
			</thead>
			<tbody>
				<%
				ResultSet grupoPermissao = GrupoPermissaoController.consultarExibir();
				while (grupoPermissao.next()) {
					out.print("<tr>");
					out.print("<td>" + grupoPermissao.getString("id") + "</td>");
					out.print("<td>" + grupoPermissao.getString("permissao") + "</td>");
					out.print("<td>" + grupoPermissao.getString("acao") + "</td>");
					String editar = "<td><a href='EditarGrupoPermissao.jsp?id=" + grupoPermissao.getString("id") + "'>Editar</a>";
					String excluir = "<td><a href='ExcluirGrupoPermissao.jsp?id=" + grupoPermissao.getString("id") + "'>Excluir</a>";
					out.print(editar + " " + excluir);
					out.print("<tr>");
				}
				%>
			</tbody>
		</table>
	</div>
	<script>
		function cadastraClick() {
			let page = "CadastroGrupoPermissao.jsp";
			document.body.innerHTML = '<object type="text/html" data="' + page + '"></object>';
		}
	</script>
</body>
</html>