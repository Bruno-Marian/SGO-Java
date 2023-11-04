<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="contollers.UsuarioController"%>
<%@page import="contollers.FuncionarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="models.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edição de Usuários</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
</head>
<div>
	<%
	String id = request.getParameter("id");
	Usuario us = UsuarioController.consultar(Integer.parseInt(id));
	%>
</div>
<body>
	<form class="caixa" action="GravarUsuario.jsp?editar=no" method="POST">
		<h3 class="mb-4">Edição de Usuários</h3>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label class="form-label">ID</label> <input type="text"
						class="form-control mb-3" name="id" value="<%out.print(id);%>"
						readonly> <label>Usuário</label> <input type="text"
						id="usuario" name="usuario" class="form-control"
						value="<%out.print(us.getLogin());%>">
					<div class="form-group">
						<label>Senha</label> <input type="password" id="senha"
							class="form-control" value="<%out.print(us.getSenha());%>">
					</div>
					<div class="form-group">
						<label>Confirmar senha</label> <input type="password"
							id="conSenha" class="form-control"
							value="<%out.print(us.getSenha());%>">
					</div>
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
						<label>Selecione o funcionário</label><select class="form-control"
							name="funcionario" id="funcionario">
							<%
							ResultSet funcionario = FuncionarioController.consultar();
							while (funcionario.next()) {
								out.print("<option value='" + funcionario.getInt("id") + "'>" + funcionario.getString("nome") + "</option>");
							}
							%>
						</select>
					</div>
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
			
			let usuario = document.getElementById('usuario');
			let senha = document.getElementById('senha');
			let selectGrupoUsuario = document.getElementById('grupoUsuario');
			let selectFuncionario = document.getElementById('funcionario');
			if(selectGrupoUsuario.value == '' || selectFuncionario.value == '' ){
				alert("Necessário informar o grupo e funcionário para efetuar a liberação");
				return
			}
			document.getElementsByTagName('form')[0].submit()
		}
	</script>
</body>
</html>