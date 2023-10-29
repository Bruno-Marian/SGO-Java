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
<title>Cadastro Usuário</title>
</head>

<body>
	<form class="caixa">
		<h3 class="mb-4">Cadastro de Funcionário</h3>
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
					<label>Função</label> <select id="funcao" class="form-control"
						required>
						<option value="administrador">Administrador</option>
						<option value="veterinario">Veterinário</option>
					</select>
				</div>
				<div class="form-group">
					<label>Usuário</label> <input type="text" id="usuario"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label>Senha</label> <input type="password" id="senha"
						class="form-control" required>
				</div>
				<div class="form-group">
					<label>Confirmar senha</label> <input type="password" id="conSenha"
						class="form-control" required>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label>CEP</label> <input type="text" id="cep" class="form-control">
				</div>
				<div class="row">
					<div class="col-md-9">
						<div class="form-group">
							<label>Rua</label> <input type="text" id="rua"
								class="form-control">
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label>Número</label> <input type="number" id="numero"
								class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label>Bairro</label> <input type="text" id="bairo"
						class="form-control">
				</div>
				<div class="form-group">
					<label>Cidade</label> <input type="text" id="cidade"
						class="form-control">
				</div>
				<div class="form-group">
					<label>Estado</label> <input type="text" id="estado"
						class="form-control">
				</div>
			</div>
		</div>
		<div class="row justify-content-end">
			<div class="col-md-2">
				<button type="submit" class="btn btn-primary float-right"
					onclick="addNewFuncionario()">Gravar</button>
			</div>
		</div>
	</form>
</body>

</html>