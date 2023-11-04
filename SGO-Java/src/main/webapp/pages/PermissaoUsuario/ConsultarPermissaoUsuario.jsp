<%@page import="contollers.PermissaoUsuarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultar Permissão de Usuários</title>
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="caixa">
		<div class="row mb-4 p-2">
			<div class="col-md-10">
				<h3>Consultar Permissão de Usuários</h3>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>Permissão</th>
						<th>Tabela</th>
						<th>Visualizar</th>
						<th>Editar</th>
						<th>Deletar</th>
						<th>Incluir</th>
					</tr>
				</thead>
				<tbody>
					<%
					ResultSet permissaoUsuarios = PermissaoUsuarioController.consultar();
					while (permissaoUsuarios.next()) {
						out.print("<tr>");
						out.print("<td>" + permissaoUsuarios.getString("id") + "</td>");
						out.print("<td>" + permissaoUsuarios.getString("permissao") + "</td>");
						out.print("<td>" + permissaoUsuarios.getString("tabela") + "</td>");
						if (permissaoUsuarios.getBoolean("visualizar") == true) {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
						} else {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
						}
						if (permissaoUsuarios.getBoolean("editar") == true) {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
						} else {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
						}
						if (permissaoUsuarios.getBoolean("deletar") == true) {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
						} else {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
						}
						if (permissaoUsuarios.getBoolean("incluir") == true) {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
						} else {
							out.print(
							"<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
						}
						out.print("<tr>");
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>