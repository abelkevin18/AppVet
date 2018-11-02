<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

<title>Clientes</title>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="card-header">REGISTRAR CLIENTE</div>
			<div class="card-body">
				<form>
					<div class="row">
						<div class="col-md-4">
							<label>Nombre: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="nombre">
							</div>
						</div>
						<div class="col-md-4">
							<label>Apellido: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="apellido">
							</div>
						</div>
						<div class="col-md-4">
							<label>Número de DNI: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="dni">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<label>Dirección: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="direccion">
							</div>
						</div>
						<div class="col-md-4">
							<label>Telefono: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="telefono">
							</div>
						</div>
					</div>
				</form>
				<button type="button" class="btn btn-primary"
					onclick="saveCliente()">Registrar</button>
			</div>
		</div>
		<br>
		<div class="card">
			<div class="card-header">Lista de Clientes</div>
			<div class="card-body">
				<table id="tableClientes" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>Nombres</th>
							<th>Apellidos</th>
							<th>DNI</th>
							<th>Direccion</th>
							<th>Teléfono</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="bodyTableClientes">

						<c:forEach var="cliente" items="${clientes}">
							<tr id="trs">
								<td class="td01">${cliente.nombre}</td>
								<td class="td02">${cliente.apellido}</td>
								<td class="td03">${cliente.dni}</td>
								<td class="td04">${cliente.direccion}</td>
								<td class="td05">${cliente.telefono}</td>
								<td><button type='button' id='${cliente.idcliente}'
										class="btn btn-warning btn-round editarCliente"
										data-toggle="modal" data-target="#modalUpdateCliente"
										title="Editar">
										<i class="far fa-edit"></i>
									</button></td>
								<td><button type='button' id='${cliente.idcliente}'
										class="btn btn-danger btn-round deleteCliente"
										title="Eliminar">
										<i class="far fa-trash-alt"></i>
									</button></td>
							</tr>
						</c:forEach>

					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>

		<!-- modal -->
		<div class="modal fade" id="modalUpdateCliente" tabindex="-1" role="">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="card">
						<div class="card-header">EDITAR CLIENTE</div>
						<div class="card-body">
							<form>
								<div class="row">
									<div class="col-md-4">
										<label>Nombre: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="nombre_">
											<input type="hidden" class="form-control" id="idcliente_">
										</div>
									</div>
									<div class="col-md-4">
										<label>Apellido: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="apellido_">
										</div>
									</div>
									<div class="col-md-4">
										<label>Número de DNI: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="dni_">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-8">
										<label>Dirección: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="direccion_">
										</div>
									</div>
									<div class="col-md-4">
										<label>Telefono: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="telefono_">
										</div>
									</div>
								</div>
							</form>
							<button type="button" class="btn btn-primary"
								onclick="editarCliente()">Editar</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- fin modal -->
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

	<!-- Data table -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

	<script src="../../js/cliente.js"></script>

</body>
</html>