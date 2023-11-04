<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../styles/Login.css">
  <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
<form class="caixa" action="ValidaLogin.jsp?editar=no" method="POST">     
<div class="login">
	<img src="../../imagens/logo.png" class="logo">    
    	<div class="form-group">
            <label>Usuário</label>
            <input type="text" class="form-control" id="login" name="login">
        </div>
        <div class="form-group">
            <label>Senha</label>
            <input type="password" class="form-control" id="senha" name="senha">
        </div>
        <button  type="submit" class="btn btn-primary float-right" 
        	onclick="logar()">Entrar</button>
</div>
</form>
<footer> </footer>
<script>
function logar(){
	event.preventDefault();
			
	let usuario = document.getElementById('login');
	let senha = document.getElementById('senha');
	if(login.value == '' || senha.value == '' ){
	  alert("Necessário informar o usuário e senha para efetuar a liberação");
	return
	}
	  document.getElementsByTagName('form')[0].submit()
	}
</script>
</body>
</html>