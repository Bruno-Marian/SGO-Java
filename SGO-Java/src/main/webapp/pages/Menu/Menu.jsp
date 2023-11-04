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
		<a onclick="setaPage('../Animal/ConsultaAnimal.jsp')" id="animal">Animais</a> 
		<a onclick="setaPage('../Doacao/ConsultaDoacao.jsp')" id="adocao">Adoção</a> 
		<a onclick="setaPage('../Funcionario/ConsultarFuncionario.jsp')" id="funcionario">Funcionários</a>
		<a onclick="setaPage('../Usuario/ConsultarUsuario.jsp')" id="usuario">Usuário</a>
		<a onclick="setaPage('../GrupoUsuario/ConsultaGrupoUsuario.jsp')" id="grupoUsuario">Grupo Usuário</a> 
		<a onclick="setaPage('../GrupoPermissao/ConsultarGrupoPermissao.jsp')" id="grupoPermissao">Grupo Permissão</a>
		<a onclick="setaPage('../PermissaoUsuario/ConsultarPermissaoUsuario.jsp')" id="permissaoUsuario">Permissão Usuário</a>
	</div>
	<script>
		const pageConst = localStorage.getItem("page");
		if (pageConst == null) {
			setaPage("../Animal/TabelaAnimal.jsp")
		} else {
			setaPage(pageConst)
		}

		function setaPage(page) { 
			localStorage.setItem("page", page)
			document.getElementById('main').innerHTML = '<object type="text/html" data="' + page + '"></object>';
		}

		function sair() {
			window.location.href = "login.jsp";
			localStorage.setItem("login", null);
		}
	</script>
</body>
</html>
