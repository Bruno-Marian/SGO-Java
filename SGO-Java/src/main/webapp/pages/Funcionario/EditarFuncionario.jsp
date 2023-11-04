<%@page import="models.Funcionario"%>
<%@page import="contollers.FuncionarioController"%>
<%@page import="contollers.FuncaoController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="./../styles/Style.css">
<title>Editar Funcionário</title>
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
	<%
	String id = request.getParameter("id");
	Funcionario fu = FuncionarioController.consultar(Integer.parseInt(id));
	%>
	<form class="caixa" action="GravarFuncionario.jsp?editar=yes"
		method="POST">
		<h3 class="mb-4">Editar Funcionário</h3>
		<div class="row">
			<div class="col-md-6">
				<div class="form_group">
					<label class="form-label">ID</label> <input type="text"
						class="form-control mb-3" name="id" value="<%out.print(id);%>"
						readonly>
				</div>
				<div class="form-group">
					<label>Informe o nome</label> <input type="text" id="nome"
						name="nome" class="form-control"
						value="<%out.print(fu.getNome());%>" required>
				</div>
				<div class="form-group">
					<label>Informe a Data Nascimento</label> <input type="date"
						id="dataNascimento" class="form-control" name="dataNascimento"
						value='<%out.print(fu.getDataNascimento());%>'
						pattern="yyyy-mm-dd" required>
				</div>
				<div class="form-group">
					<label>Informe a função</label> <select id="funcao"
						class="form-control" name="funcao" required>
						<%
						ResultSet funcao = FuncaoController.consultar();
						while (funcao.next()) {
							if (funcao.getInt("ID") == fu.getFuncao()) {
								out.print("<option selected value='" + funcao.getInt("id") + "'>" + funcao.getString("nome") + "</option>");
							} else {
								out.print("<option value='" + funcao.getInt("id") + "'>" + funcao.getString("nome") + "</option>");
							}
						}
						%>
					</select>
				</div>
				<div class="form-group">
					<label>Informe o sexo</label> <select id="sexo"
						class="form-control" name="sexo" required>
						<%
						if (fu.getSexo().equals("M")) {
							out.print("<option selected value='M'>Masculino</option>");
						} else {
							out.print("<option value='M'>Masculino</option>");
						}
						if (fu.getSexo().equals("F")) {
							out.print("<option selected value='F'>Feminino</option>");
						} else {
							out.print("<option value='F'>Feminino</option>");
						}
						if (fu.getSexo().equals("O")) {
							out.print("<option selected value='O'>Outros</option>");
						} else {
							out.print("<option value='O'>Outros</option>");
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
	<footer></footer>
	<script>
		function validar(){
			event.preventDefault();
			
			let nome = document.getElementById('nome');
			let sexo = document.getElementById('sexo');
			let dataNascimento = document.getElementById('dataNascimento');
			if(nome.value == '' ){
				alert("Necessário informar o nome do funcionário!");
				return
			}
			if(sexo.value == '' ){
				alert("Necessário informar o sexo do funcionário!");
				return
			}
			if(dataNascimento.value == '' ){
				alert("Necessário informar a data de nascimento do funcionário!");
				return
			}
			document.getElementsByTagName('form')[0].submit()
		}
	</script>
</body>

</html>