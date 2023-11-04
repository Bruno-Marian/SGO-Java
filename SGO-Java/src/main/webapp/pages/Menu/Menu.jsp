<%@page import="contollers.UsuarioController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../styles/Menu.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Menu</title>
</head>

<body>
	<div id="myNavbar">
		<nav>
			<div class="fundoLogo">
				<img src="../../imagens/logo.png" class="logo">
			</div>
			<img onclick="sair()" src="../../imagens/sair.png" class="sair">
		</nav>
	</div>


	<div id="mySidenav" class="sidenav">
		<div id="main" class="mainContent"></div>
		<a href="../Animal/ConsultaAnimal.jsp" id="animal">Animais</a> 
		<a href="../Doacao/ConsultaDoacao.jsp" id="adocao">Adoção</a> 
		<a href="../Funcionario/ConsultarFuncionario.jsp" id="funcionario">Funcionários</a>
		<a href="../Usuario/ConsultarUsuario.jsp" id="usuario">Usuário</a>
		<a href="../GrupoUsuario/ConsultaGrupoUsuario.jsp" id="grupoUsuario">Grupo Usuário</a> 
		<a href="../GrupoPermissao/ConsultarGrupoPermissao.jsp" id="grupoPermissao">Grupo Permissão</a>
		<a href="../PermissaoUsuario/ConsultarPermissaoUsuario.jsp" id="permissaoUsuario">Permissão Usuário</a>
	</div>
	<script>
		function sair() {
			window.location.href = "MenuSair.jsp";
		}
	</script>
</body>
</html>
