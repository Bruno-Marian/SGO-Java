<%@page import="utils.Permissoes"%>
<%@page import="contollers.FuncaoController"%>
<%@page import="models.Funcao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Funções</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
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
	<%
	String id = request.getParameter("id");
	Funcao f = FuncaoController.consultar(Integer.parseInt(id));
	%>
	<header class="mt-4">
		<h1 class="text-center">Editar Funções</h1>
	</header>
	<nav></nav>
	<main class="container m-5">
		<form action="GravarFuncao.jsp?editar=yes" method="POST">
			<label class="form-label">ID</label> <input type="text"
				class="form-control mb-3" name="id" value="<%out.print(id);%>"
				readonly> <label class="form-label">Informe o nome
				da função</label> <input id="nome" type="text" class="form-control mb-3"
				placeholder="Informe o nome da função" name="nome"
				value="<%out.print(f.getNome());%>">

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