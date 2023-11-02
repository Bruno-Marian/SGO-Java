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
 <div class="login">
        <img src="../../imagens/logo.png" class="logo">
        <div id="mensagemErro" class="alert alert-danger h5" role="alert">Usuário e/ou senha inválido(s)!</div>
        <div class="form-group">
            <label>Usuário</label>
            <input type="email" class="form-control" id="usuario">
        </div>
        <div class="form-group">
            <label>Senha</label>
            <input type="password" class="form-control" id="senha">
        </div>
        <button onclick="logar()" type="button" class="btn btn-outline-info btn-lg">Entrar</button>
    </div>
    <script>
        document.getElementById("mensagemErro").style.display = "none"
        function logar() {
            let user = { "user": usuario.value, "password": senha.value, "login": Date().toLocaleString() };

            if (validaLogar(user)) {
                localStorage.setItem("login", JSON.stringify(user));
                window.location.href = "../Master/Master.jsp";
            }
        }
        
        function validaLogar(usuario) {
            if(usuario.user === "sgo" && usuario.password === "sysmaster"){
                return true;
            }
            else {
                document.getElementById("mensagemErro").style.display = "block"
            }
        }
    </script>
</html>