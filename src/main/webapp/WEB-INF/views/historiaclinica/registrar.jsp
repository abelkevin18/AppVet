<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- Data table -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">

<!-- font awesome icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">

<title>Historia Clinica</title>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-header">REGISTRAR HISTORIA CLINICA</div>
			<div class="card-body">
			Datos de la mascota:
				<table id="tableMascotas" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Especie</th>
							<th>Raza</th>
							<th>F.N.</th>
							<th>Sexo</th>
							<th>Características</th>
							<th>Propietario</th>
						</tr>
					</thead>
					<tbody>
						<tr id="trs">
							<td class="td01">${mascota.nombremascota}</td>
							<td class="td02">${mascota.especie}</td>
							<td class="td03">${mascota.raza}</td>
							<td class="td04">${mascota.fechanacimiento}</td>
							<td class="td05">${mascota.sexo}</td>
							<td class="td06">${mascota.caracteristicas}</td>
							<td class="td07">${mascota.cliente.nombre} ${mascota.cliente.apellido}</td>
						</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
				<form>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Motivo Consulta:</label>
								<textarea class="form-control" id="motivoconsulta" rows="2"></textarea>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Temperatura:</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="temperatura">
							</div>
						</div>
						<div class="col-md-6">
							<label>Frec. Cardiaca: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="frecuenciacardiaca">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Frec. Respiratoria</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control"
									id="frecuenciarespiratoria">
							</div>
						</div>
						<div class="col-md-6">
							<label>Peso: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="peso">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Sintomas:</label>
								<textarea class="form-control" id="sintomas" rows="2"></textarea>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Anamnesis:</label>
								<textarea class="form-control" id="anamnesis" rows="2"></textarea>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Diagnostico Presuntivo:</label>
								<textarea class="form-control" id="diagnosticopresuntivo"
									rows="2"></textarea>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Pruebas Clínicas:</label>
								<textarea class="form-control" id="pruebasclinicas" rows="2"></textarea>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Diagnóstico Definitivo:</label>
								<textarea class="form-control" id="diagnosticodefinitivo"
									rows="2"></textarea>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Plan de Tratamiento:</label>
								<textarea class="form-control" id="plantratamiento" rows="3"></textarea>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Observaciones:</label>
								<textarea class="form-control" id="observaciones" rows="2"></textarea>
							</div>
						</div>
					</div>


				</form>
				<button type="button" class="btn btn-primary savehc" id="${mascota.idmascota}">Registrar</button>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="../../js/hc.js"></script>
</body>
</html>