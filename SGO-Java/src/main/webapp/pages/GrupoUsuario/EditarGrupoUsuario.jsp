<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="models.GrupoUsuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edição de Grupo de Usuários</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<%
	String id = request.getParameter("id");
	GrupoUsuario gu = GrupoUsuarioController.consultar(Integer.parseInt(id));
	%>
	<header class="mt-4">
		<h1 class="text-center">Edição de Grupo de Usuários</h1>
	</header>
	<nav></nav>
	<main class="container m-5">
		<form action="GravarGrupoUsuario.jsp?editar=yes" method="POST">
			<label class="form-label">ID</label>
         	<input type="text" class="form-control mb-3" name="id" value="<%out.print(id);%>" readonly>
			<label class="form-label">Informe a ação</label> <input id="acao"
				type="text" class="form-control mb-3" placeholder="Informe a ação"
				name="acao" value="<%out.print(gu.getAcao());%>"> <label class="form-label">Informe a
				observação</label> <input id="observacao" type="text"
				class="form-control mb-3" placeholder="Informe a observação"
				name="observacao" value="<%out.print(gu.getObservacao());%>">

			<div class="m-3">
				<button class="btn btn-outline-primary" onclick="validar()">Gravar</button>
			</div>
		</form>
	</main>
	<footer> </footer>
	<script>
		function validar(){
			event.preventDefault();
			
			let inputAcao = document.getElementById('acao')
			if(inputAcao.value == ''){
				alert("Necessário informar qual a ação que os usúarios pertencentes ao grupo vão realizar e/ou obter permissões.")
				return
			}
			document.getElementsByTagName('form')[0].submit()
		}
	</script>

</body>
</html>