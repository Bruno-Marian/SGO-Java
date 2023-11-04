<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="models.GrupoUsuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edição de Grupo de Usuários</title>
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<div>
	<%
	String id = request.getParameter("id");
	GrupoUsuario gu = GrupoUsuarioController.consultar(Integer.parseInt(id));
	%>
</div>
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
	<form class="caixa" action="GravarGrupoUsuario.jsp?editar=yes"
		method="POST">
		<h3 class="mb-4">Edição de Grupo de Usuários</h3>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label class="form-label">ID</label> <input type="text"
						class="form-control mb-3" name="id" value="<%out.print(id);%>"
						readonly> <label>Informe a ação</label> <input type="text"
						id="acao" class="form-control" placeholder="Informe a ação"
						name="acao" value="<%out.print(gu.getAcao());%>">
				</div>
				<div class="form-group">
					<label>Informe a observação</label> <input id="observacao"
						type="text" class="form-control"
						placeholder="Informe a observação" name="observacao"
						value="<%out.print(gu.getObservacao());%>">
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