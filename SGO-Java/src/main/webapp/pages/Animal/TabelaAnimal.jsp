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
<script src="./../controllers/listAnimal.js"></script>
<title>Animais</title>
</head>

<body>
	<div class="caixa">
		<div class="row mb-4 p-2">
			<div class="col-md-10">
				<h3>Animais Cadastrados</h3>
			</div>
			<div class="col-md-2">
				<button class="btn btn-success float-right"
					onclick="cadastraClick()">Cadastrar</button>
			</div>
		</div>
		<div id="box"></div>
	</div>

	<script>
		listAnimal()

		function listAnimal() {
			//Retorna nova informação salva na memória
			document.getElementById("box").innerHTML = retornaTableAnimal();
		}
	</script>
</body>

</html>