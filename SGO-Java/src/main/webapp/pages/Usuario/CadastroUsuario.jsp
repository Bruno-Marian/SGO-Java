<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="contollers.FuncionarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cadastro de Usuário</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
</head>
<body>
	<form class="caixa" action="GravarUsuario.jsp?editar=no" method="POST">
		<h3 class="mb-4">Cadastro de Usuário</h3>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label>Usuário</label> <input type="text" id="usuario"
						name="usuario" class="form-control" required>
				</div>
				<div class="form-group">
					<label>Senha</label> <input type="password" id="senha"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label>Confirmar senha</label> <input type="password" id="conSenha"
						class="form-control" required>
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