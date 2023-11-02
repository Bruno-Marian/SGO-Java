<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="./../controllers/cadastroAnimal.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../styles/Style.css">
<title>Cadastro de Animal</title>
</head>

<body>
	<form class="caixa">
		<h3 class="mb-4">Cadastro de Animal</h3>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label>Nome</label> <input type="text" id="nome"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label>Idade</label> <input type="number" id="idade"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label>Porte</label> <select id="porte" class="form-control"
						required>
						<option value="Pequeno">Pequeno</option>
						<option value="Médio">Médio</option>
						<option value="Grande">Grande</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label>Saúde</label>
					<textarea class="form-control" id="saude" cols="70" rows="3"
						maxlength="180" required></textarea>
				</div>
				<div class="row">
					<label class="col-md-6"> Espécie
						<div class="col-md-12">
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input id="gato"
									class="form-check-input" type="radio" name="especie"
									value="Gato" required> Gato(a)
								</label>
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input id="cachorro"
									class="form-check-input" type="radio" name="especie"
									value="Cachorro" required> Cachorro(a)
								</label>
							</div>
						</div>
					</label> <label class="col-md-6"> Gênero
						<div class="col-md-12">
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input id="femea"
									class="form-check-input" type="radio" name="genero"
									value="Fêmea" required> Fêmea
								</label>
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label"> <input id="macho"
									class="form-check-input" type="radio" name="genero"
									value="Macho" required> Macho
								</label>
							</div>
						</div>
					</label>
				</div>
			</div>
		</div>
		<div class="row justify-content-end">
			<div class="col-md-2">
				<button type="submit" id="botaoAddAnimal"
					class="btn btn-primary float-right" onclick="addNewAnimal(true)">Gravar</button>
			</div>
		</div>
	</form>

	<script>
		//Função para adicinar um novo animal
		let animalEdit = localStorage.getItem("animalEdit");
		if (animalEdit != "null") {
			loadAnimal(animalEdit)
			localStorage.setItem("animalEdit", null);
		}
	</script>

</body>

</html>