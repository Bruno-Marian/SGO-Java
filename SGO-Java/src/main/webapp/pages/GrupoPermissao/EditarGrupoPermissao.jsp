<%@page import="models.GrupoPermissao"%>
<%@page import="contollers.GrupoPermissaoController"%>
<%@page import="contollers.PermissaoUsuarioController"%>
<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Grupo de Permissão</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<%
	String id = request.getParameter("id");
	GrupoPermissao gp = GrupoPermissaoController.consultar(Integer.parseInt(id));
	%>
	<header class="mt-4">
		<h1 class="text-center">Editar Grupo de Permissão</h1>
	</header>
	<nav></nav>
	<main class="container m-5">
		<form action="GravarGrupoPermissao.jsp?editar=yes" method="POST">
			<label class="form-label">ID</label> <input type="text"
				class="form-control mb-3" name="id" value="<%out.print(id);%>"
				readonly> <label class="form-label">Selecione o
				grupo de usuários</label> <select class="form-select" name="grupoUsuario"
				id="grupoUsuario">
				<%
				ResultSet grupoUsuarios = GrupoUsuarioController.consultar();
				while (grupoUsuarios.next()) {
					if (grupoUsuarios.getInt("ID") == gp.getGrupo_usuario()) {
						out.print(
						"<option selected value='" + grupoUsuarios.getInt("id") + "'>" + grupoUsuarios.getString("acao") + "</option>");
					} else {
						out.print(
						"<option value='" + grupoUsuarios.getInt("id") + "'>" + grupoUsuarios.getString("acao") + "</option>");
					}
				}
				%>
			</select> <label class="form-label">Selecione a permissão de usuário</label> <select
				class="form-select" name="permissaoUsuario" id="permissaoUsuario">
				<%
				ResultSet permissaoUsuario = PermissaoUsuarioController.consultar();
				while (permissaoUsuario.next()) {
					if (permissaoUsuario.getInt("ID") == gp.getPermisssao_usuario()) {
						out.print("<option selected value='" + permissaoUsuario.getInt("id") + "'>"
						+ permissaoUsuario.getString("permissao") + "</option>");
					} else {
						out.print("<option value='" + permissaoUsuario.getInt("id") + "'>" + permissaoUsuario.getString("permissao")
						+ "</option>");
					}
				}
				%>
			</select>


			<div class="m-3">
				<button class="btn btn-outline-primary" onclick="validar()">Gravar</button>
			</div>
		</form>
	</main>
	<footer> </footer>
	<script>
		function validar(){
			event.preventDefault();
			
			let selectGrupoUsuario = document.getElementById('grupoUsuario');
			let selectPermissaoUsuario = document.getElementById('permissaoUsuario');
			if(selectGrupoUsuario.value == '' || selectPermissaoUsuario.value == '' ){
				alert("Necessário informar o grupo e permissão de usuário para efetuar a liberação");
				return
			}
			document.getElementsByTagName('form')[0].submit()
		}
	</script>
</body>
</html>