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
<link rel="stylesheet" href="../../css/stylebar.css">

<title>Lista de Usuarios</title>
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<%@include file="../partials/navbar.jsp"%>

		<div class="content">
			<%@include file="../partials/bar.jsp"%>
			<div class="card">
				<div class="card-header">REGISTRAR USUARIO</div>
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
						<hr>
						<div class="row">
							<div class="col-md-4">
								<label>Nombre de Usuario: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="far fa-user"></i></span>
									</div>
									<input type="text" class="form-control" id="nombreusuario">
								</div>
							</div>
							<div class="col-md-4">
								<label>Clave: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="far fa-user"></i></span>
									</div>
									<input type="password" class="form-control" id="clave1">
								</div>
							</div>
							<div class="col-md-4">
								<label>Repetir Clave: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="far fa-user"></i></span>
									</div>
									<input type="password" class="form-control" id="clave2">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6">
								<label>Estado: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text"><i class="far fa-user"></i></label>
									</div>
									<select class="custom-select" id="estado">
										<option value="Habilitado">Habilitado</option>
										<option value="Deshabilitado">Deshabilitado</option>

									</select>
								</div>
							</div>
							<div class="col-md-6">
								<label>Cargo: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text"><i class="far fa-user"></i></label>
									</div>
									<select class="custom-select" id="cargo">
										<option value="Trabajador">Trabajador</option>
										<option value="Administrador">Administrador</option>
									</select>
								</div>
							</div>
						</div>
					</form>
					<button type="button" class="btn btn-primary" onclick="saveUser()">Registrar</button>
				</div>
			</div>
			<div class="card">
				<div class="card-header">Lista de Usuarios</div>
				<div class="card-body">
					<table id="tableUsuarios"
						class="table table-striped table-bordered" style="width: 100%">
						<thead>
							<tr>
								<th>Nombres</th>
								<th>Apellidos</th>
								<th>DNI</th>
								<th>Direccion</th>
								<th>Teléfono</th>
								<th>Nombre Usuario</th>
								<th>Estado</th>
								<th>Cargo</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody id="bodyTableUsuarios">

							<c:forEach var="user" items="${users}">
								<tr id="trs">
									<td class="td01">${user.nombre}</td>
									<td class="td02">${user.apellido}</td>
									<td class="td03">${user.dni}</td>
									<td class="td04">${user.direccion}</td>
									<td class="td05">${user.telefono}</td>
									<td class="td06">${user.nombreusuario}</td>
									<td class="td07">${user.estado}</td>
									<td class="td08">${user.cargo}</td>

									<td><button type='button' id='${user.idusuario}'
											class="btn btn-warning btn-round editarUsuario"
											data-toggle="modal" data-target="#modalUpdateUsuario"
											title="Editar">
											<i class="far fa-edit"></i>
										</button></td>
									<td><button type='button' id='${user.idusuario}'
											class="btn btn-danger btn-round deleteUsuario"
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
			<div class="modal fade" id="modalUpdateUsuario" tabindex="-1" role="">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="card">
							<div class="card-header">REGISTRAR USUARIO</div>
							<div class="card-body">
								<form>
									<div class="row">
										<div class="col-md-4">
											<label>Nombre: </label>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="far fa-user"></i></span>
												</div>
												<input type="text" class="form-control" id="nombre_">
												<input type="hidden" class="form-control" id="idusuario_">
											</div>
										</div>
										<div class="col-md-4">
											<label>Apellido: </label>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="far fa-user"></i></span>
												</div>
												<input type="text" class="form-control" id="apellido_">
											</div>
										</div>
										<div class="col-md-4">
											<label>Número de DNI: </label>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="far fa-user"></i></span>
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
													<span class="input-group-text"><i
														class="far fa-user"></i></span>
												</div>
												<input type="text" class="form-control" id="direccion_">
											</div>
										</div>
										<div class="col-md-4">
											<label>Telefono: </label>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="far fa-user"></i></span>
												</div>
												<input type="text" class="form-control" id="telefono_">
											</div>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-md-8">
											<label>Nombre de Usuario: </label>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="far fa-user"></i></span>
												</div>
												<input type="text" class="form-control" id="nombreusuario_">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<label>Estado: </label>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text"><i
														class="far fa-user"></i></label>
												</div>
												<select class="custom-select" id="estado_">
													<option value="Habilitado">Habilitado</option>
													<option value="Deshabilitado">Deshabilitado</option>

												</select>
											</div>
										</div>
										<div class="col-md-6">
											<label>Cargo: </label>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<label class="input-group-text"><i
														class="far fa-user"></i></label>
												</div>
												<select class="custom-select" id="cargo_">
													<option value="Trabajador">Trabajador</option>
													<option value="Administrador">Administrador</option>
												</select>
											</div>
										</div>
									</div>
								</form>
								<button type="button" class="btn btn-primary"
									onclick="editarUsuario()">Editar</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Cancelar</button>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- fin modal -->
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

	<!-- Data table -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

	<script src="../../js/usuario.js"></script>

</body>
</html>