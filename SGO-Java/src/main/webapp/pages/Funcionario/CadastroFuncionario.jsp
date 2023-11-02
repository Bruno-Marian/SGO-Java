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
<link rel="stylesheet" href="../../styles/Style.css">
<title>Cadastro de Funcionário</title>
</head>

<body>
	<form class="caixa" action="GravarFuncionario.jsp?editar=no"
		method="POST">
		<h3 class="mb-4">Cadastro de Funcionário</h3>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label>Informe o nome</label> <input type="text" id="nome"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label>Informe a Data Nascimento</label> <input type="date"
						id="dataNascimento" class="form-control" required>
				</div>
				<div class="form-group">
					<label>Informe a função</label> <select id="funcao" class="form-control"
						required>
						<%
						ResultSet funcao = FuncaoController.consultar();
						while (funcao.next()) {
							out.print("<option value='" + funcao.getInt("id") + "'>" + funcao.getString("nome") + "</option>");
						}
						%>
					</select>
				</div>
				<div class="form-group">
					<label>Informe o sexo</label> <select id="sexo" class="form-control" required>
						<option value="M">Masculino</option>
						<option value="F">Feminino</option>
						<option value="O">Outros</option>
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