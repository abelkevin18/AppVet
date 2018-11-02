<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>Mascota</title>
</head>
<body>


	<div class="container">
		<div class="card">
			<div class="card-header">REGISTRAR MASCOTA</div>
			<div class="card-body">
				<form>
					<div class="row">
						<div class="col-md-6">
							<label>Nombre Mascota: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="nombremascota">
							</div>
						</div>
						<div class="col-md-6">
							<label>Dueño: </label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="propietario">
								<input type="text" class="form-control" id="idcliente">
								<div class="input-group-append">
									<button class="btn btn-success showclientes" type="button"
										id="show01" data-toggle="modal"
										data-target="#modalListaClientes">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Especie: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="especie">
							</div>
						</div>
						<div class="col-md-6">
							<label>Raza: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="raza">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<label>Fecha Nacimiento: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="date" class="form-control" id="fechanacimiento">
							</div>
						</div>
						<div class="col-md-6">
							<label>Sexo: </label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="far fa-user"></i></span>
								</div>
								<input type="text" class="form-control" id="sexo">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Características:</label>
								<textarea class="form-control" id="caracteristicas" rows="3"></textarea>
							</div>
						</div>
					</div>
				</form>
				<button type="button" class="btn btn-primary"
					onclick="saveMascota()">Registrar</button>
			</div>
		</div>
		<br>
		<div class="card">
			<div class="card-header">Lista de Mascotas</div>
			<div class="card-body">
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
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="mascota" items="${mascotas}">

							<tr id="trs">
								<td class="td01">${mascota.nombremascota}</td>
								<td class="td02">${mascota.especie}</td>
								<td class="td03">${mascota.raza}</td>
								<td class="td04"><fmt:formatDate pattern="dd-MM-yyyy"
										value="${mascota.fechanacimiento}" /></td>
								<td class="td05">${mascota.sexo}</td>
								<td class="td05">${mascota.caracteristicas}</td>
								<td><button type='button' id='${mascota.idmascota}'
										class="btn btn-warning btn-round editarMascota"
										data-toggle="modal" data-target="#modalUpdateMascota"
										title="Editar">
										<i class="far fa-edit"></i>
									</button>
									<button type='button' id='${mascota.idmascota}'
										class="btn btn-danger btn-round deleteMascota"
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
		<input type="text" id="showlistcliente" value="0"/>
		<!-- modal -->
		<div class="modal fade" id="modalUpdateMascota" tabindex="-1" role="">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="card">
						<div class="card-header">EDITAR MASCOTA</div>
						<div class="card-body">
							<form>
								<div class="row">
									<div class="col-md-6">
										<label>Nombre Mascota: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="nombremascota_">
											<input type="text" class="form-control" id="idmascota_">
										</div>
									</div>
									<div class="col-md-6">
										<label>Dueño: </label>
										<div class="input-group mb-3">
											<input type="text" class="form-control" id="propietario_">
											<input type="text" class="form-control" id="idcliente_">
											<div class="input-group-append">
												<button class="btn btn-success showclientes" type="button"
													id="show02" data-toggle="modal"
													data-target="#modalListaClientes">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Especie: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="especie_">
										</div>
									</div>
									<div class="col-md-6">
										<label>Raza: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="raza_">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>Fecha Nacimiento: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="date" class="form-control" id="fechanacimiento_">
										</div>
									</div>
									<div class="col-md-6">
										<label>Sexo: </label>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-user"></i></span>
											</div>
											<input type="text" class="form-control" id="sexo_">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Características:</label>
											<textarea class="form-control" id="caracteristicas_" rows="3"></textarea>
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
		<!-- modal -->
		<div class="modal fade" id="modalListaClientes" tabindex="-1" role="">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="card">
						<div class="card-header">Elegir el propietario de la mascota</div>
						<div class="card-body">
							<table id="tableClientes"
								class="table table-striped table-bordered" style="width: 100%">
								<thead>
									<tr>
										<th>Nombres</th>
										<th>Apellidos</th>
										<th>DNI</th>
										<th>Direccion</th>
										<th>Teléfono</th>
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
													class="btn btn-success elegirCliente" title="Elegir">
													<i class="fas fa-check"></i>
												</button></td>
										</tr>
									</c:forEach>

								</tbody>
								<tfoot>
								</tfoot>
							</table>

							<button type="button" class="btn btn-danger" data-dismiss="modal"
								id="closeModal">Cancelar</button>
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

	<script src="../../js/mascota.js"></script>

</body>
</html>