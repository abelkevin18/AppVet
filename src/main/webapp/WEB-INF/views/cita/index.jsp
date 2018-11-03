<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Citas</title>

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
<!-- Our Custom CSS -->
<link rel="stylesheet" href="../../css/stylebar.css">

</head>

<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<%@include file="../partials/navbar.jsp"%>

		<!-- Page Content  -->
		<div id="content">

			<%@include file="../partials/bar.jsp"%>
			<div class="container">
				<div class="card">
					<div class="card-header">REGISTRAR CITA</div>
					<div class="card-body">
						<form>
							<div class="row">
								<div class="col-md-8">
									<label>Mascota: </label>
									<div class="input-group mb-3">
										<input type="text" class="form-control" id="nombremascota"
											disabled> <input type="hidden" class="form-control"
											id="idmascota">
										<div class="input-group-append">
											<button class="btn btn-success showmascota" type="button"
												id="show01" data-toggle="modal"
												data-target="#modalListaMascotas">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<label>Fecha Cita: </label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="far fa-user"></i></span>
										</div>
										<input type="date" class="form-control" id="fechacita">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<label>Lugar: </label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="far fa-user"></i></span>
										</div>
										<input type="text" class="form-control" id="lugar">
									</div>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<label>Especificaciones:</label>
										<textarea class="form-control" id="especificaciones" rows="3"></textarea>
									</div>
								</div>
							</div>
						</form>
						<button type="button" class="btn btn-primary" onclick="saveCita()">Registrar</button>
					</div>
				</div>
				<br>
				<div class="card">
					<div class="card-header">Citas</div>
					<div class="card-body">
						<table id="tableCitas"
							class="table table-striped table-bordered" style="width: 100%">
							<thead>
								<tr>
									<th>Mascota</th>
									<th>Propietario</th>
									<th>Fecha Cita</th>
									<th>Lugar</th>
									<th>Especificaciones</th>
									<th></th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="cita" items="${citas}">

									<tr id="trs">
										<td class="td01">${cita.mascota.nombremascota}</td>
										<td class="td02">${cita.mascota.cliente.nombre}</td>
										<td class="td03"><fmt:formatDate pattern="dd-MM-yyyy"
												value="${cita.fechacita}" /></td>
										<td class="td04">${cita.lugar}</td>
										<td class="td05">${cita.especificaciones}</td>
										<td><button type='button' 
												class="btn btn-warning btn-round"
												title="Editar">
												<i class="far fa-edit"></i>
											</button>
											<button type='button'
												class="btn btn-danger btn-round"
												title="Eliminar">
												<i class="far fa-trash-alt"></i>
											</button>
											</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</div>
				</div>


				<!-- modal -->
				<div class="modal fade" id="modalListaMascotas" tabindex="-1"
					role="">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="card">
								<div class="card-header">Elegir la mascota</div>
								<div class="card-body">

									<table id="tableMascotas"
										class="table table-striped table-bordered" style="width: 100%">
										<thead>
											<tr>
												<th>Nombre</th>
												<th>Especie</th>
												<th>Raza</th>
												<th>Características</th>
												<th>Propietario</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="mascota" items="${mascotas}">

												<tr id="trs">
													<td class="td01">${mascota.nombremascota}</td>
													<td class="td02">${mascota.especie}</td>
													<td class="td03">${mascota.raza}</td>
													<td class="td04">${mascota.caracteristicas}</td>
													<td class="td05">${mascota.cliente.nombre} ${mascota.cliente.apellido}</td>
													<td><button type='button' id='${mascota.idmascota}'
															class="btn btn-success elegirMascota" title="Elegir">
															<i class="fas fa-check"></i>
														</button></td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
										</tfoot>
									</table>

									<button type="button" class="btn btn-danger"
										data-dismiss="modal" id="closeModal">Cancelar</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- fin modal -->

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

	<!-- Data table -->
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

	<script src="../../js/cita.js"></script>
</body>

</html>