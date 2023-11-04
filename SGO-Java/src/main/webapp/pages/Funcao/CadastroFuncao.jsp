<%@page import="utils.Permissoes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Funções</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<header class="mt-4">
		<h1 class="text-center">Cadastro de Funções</h1>
	</header>
	<nav></nav>
	<%
	if (UsuarioController.getUsuarioIdLogado() == 0) {
		response.sendRedirect("../Login/Login.jsp");
	} else if (!UsuarioController.temPermissao(Permissoes.TOTAL_TELAS_SOBRE_FUNCAO)) {
		response.sendRedirect("../Menu/Menu.jsp");
	}
	%>
	<nav>
		<%@ include file="../Menu/Menu.jsp"%>
	</nav>
	<main class="container m-5">
		<form action="GravarFuncao.jsp?editar=no" method="POST">
			<label class="form-label">Informe o nome da função</label> <input
				id="nome" type="text" class="form-control mb-3"
				placeholder="Informe o nome da função" name="nome">

			<div class="m-3">
				<button class="btn btn-outline-primary" onclick="validar()">Gravar</button>
			</div>
		</form>
	</main>
	<footer> </footer>
	<script>
		function validar(){
			event.preventDefault();
			
			let inputFuncao = document.getElementById('nome')
			if(inputFuncao.value == ''){
				alert("Necessário informar o nome da função")
				return
			}
			
			document.getElementsByTagName('form')[0].submit()
		}
	</script>
</body>
</html>