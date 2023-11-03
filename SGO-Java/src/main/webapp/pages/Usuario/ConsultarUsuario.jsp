<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="./../styles/style.css">
    <script src="./../controllers/listUsuario.js"></script>
    <title>Usuário</title>
</head>

<body>
    <div class="caixa">
        <div class="row mb-4 p-2">
            <div class="col-md-10">
                <h3>Usuário</h3>
            </div>
            <div class="col-md-2">
                <button class="btn btn-success float-right" onclick="cadastraClick()">Cadastrar</button>
            </div>
        </div>
        <div id="box"></div>
    </div>
    <script>
        document.getElementById("box").innerHTML = retornaTableUsuario();     
   </script>
</body>

</html>