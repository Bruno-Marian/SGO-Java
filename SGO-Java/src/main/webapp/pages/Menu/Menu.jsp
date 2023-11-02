<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../styles/Menu.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<title>Document</title>
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
		<a onclick="setaPage('CadastroAnimal.jsp')" id="animal">Animal</a> <a
			onclick="setaPage('TabelaDoacao.jsp')" id="adocao">Adoção</a> <a
			onclick="setaPage('CadastroGrupoUsuario.jsp')" id="grupoUsuario">Grupo Usuário</a> <a 
			onclick="setaPage('CadastroGrupoPermissao.jsp')" id="grupoPermissao">Grupo Permissão</a> <a
			onclick="setaPage('CadastroUsuario.jsp')" id="usuario">Usuário</a>
	</div>
	<script>
		const pageConst = localStorage.getItem("page");
		if (pageConst == null) {
			setaPage("TabelaAnimal.jsp")
		} else {
			setaPage(pageConst)
		}

		function setaPage(page) {
			localStorage.setItem("page", page)
			document.getElementById('main').innerHTML = `<object type="text/html" data="${page}"></object>`;
		}

		function sair() {
			window.location.href = "login.jsp";
			localStorage.setItem("login", null);
		}
	</script>
</body>
</html>
