<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/Master.css">
    <title>Document</title>
</head>

<body>
    <div id="myNavbar">
        <nav>
            <div class="fundoLogo">
                <img src="../../imagens/logo.png" class="logo">
            </div>
            <img onclick="sair()" src="../imagens/sair.png" class="sair">
        </nav>
    </div>

    
    <div id="mySidenav" class="sidenav">
        <div id="main" class="mainContent"></div>
        <a onclick="setaPage('TabelaAnimal.jsp')" id="animal">Animal</a>
        <a onclick="setaPage('tabelaDoacao.html')" id="adocao">Adoção</a>
        <a onclick="setaPage('tabelaUsuario.html')" id="funcionario">Funcionário</a>
    </div>
    <script>
        const pageConst = localStorage.getItem("page");
        if (pageConst == null) {
            setaPage("tabelaAnimal.html")
        } else {
            setaPage(pageConst)
        }

        function setaPage(page) {
            localStorage.setItem("page", page)
            document.getElementById('main').innerHTML = `<object type="text/html" data="${page}"></object>`;
        }

        function sair() {
            window.location.href = "login.html";
            localStorage.setItem("login", null);
        }

    </script>
</body>
</html>
