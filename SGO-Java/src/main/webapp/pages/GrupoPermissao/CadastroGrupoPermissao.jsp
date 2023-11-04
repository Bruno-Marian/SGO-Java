<%@page import="contollers.PermissaoUsuarioController"%>
<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro Grupo de Permissão</title>
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
	} else if (!UsuarioController.temPermissao("VISUALIZAR TABELA PERMISSAO USUARIO")) {
		response.sendRedirect("../Menu/Menu.jsp");
	}
	%>
	<nav>
		<%@ include file="../Menu/Menu.jsp"%>
	</nav>
	<form class="caixa" action="GravarGrupoPermissao.jsp?editar=no"
		method="POST">
		<h3 class="mb-4">Cadastro Grupo de Permissão</h3>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label>Selecione o grupo de usuários</label> <select
						class="form-control" name="grupoUsuario" id="grupoUsuario">
						<%
						ResultSet grupoUsuarios = GrupoUsuarioController.consultar();
						while (grupoUsuarios.next()) {
							out.print("<option value='" + grupoUsuarios.getInt("id") + "'>" + grupoUsuarios.getString("acao") + "</option>");
						}
						%>
					</select>
				</div>
				<div class="form-group">
					<label>Selecione a permissão de usuário</label> <select
						class="form-control" name="permissaoUsuario" id="permissaoUsuario">
						<%
						ResultSet permissaoUsuario = PermissaoUsuarioController.consultar();
						while (permissaoUsuario.next()) {
							out.print("<option value='" + permissaoUsuario.getInt("id") + "'>" + permissaoUsuario.getString("permissao")
							+ "</option>");
						}
						%>
					</select>
				</div>
			</div>
		</div>
		<div class="row justify-content-end">
			<div class="col-md-2">
				<button type="submit" class="btn btn-primary float-right"
					onclick="validar()">Gravar</button>
			</div>
		</div>
	</form>
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