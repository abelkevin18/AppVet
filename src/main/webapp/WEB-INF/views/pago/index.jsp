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

<link rel="stylesheet" href="../../css/stylebar.css">
<link rel="stylesheet" href="../../css/style01.css">

<title>Pago</title>
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<%@include file="../partials/navbar.jsp"%>
		<div class="container">
			<div class="content">

				<%@include file="../partials/bar.jsp"%>
				<div class="card">
					<div class="card-header">REGISTRAR PAGO</div>
					<div class="card-body">

						<div class="row">
							<div class="col-md-6">
								<label>Cliente: </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="cliente"> <input
										type="hidden" class="form-control" id="idcliente">
									<div class="input-group-append">
										<button class="btn btn-success showclientes" type="button"
											id="show01" data-toggle="modal"
											data-target="#modalListaClientes">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>

							<div class="col-md-6">
								<label>Fecha: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="far fa-user"></i></span>
									</div>
									<input type="date" class="form-control" id="fechapago">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-2">
								<label>Cantidad: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="far fa-user"></i></span>
									</div>
									<input type="text" class="form-control" id="cantidad">
								</div>
							</div>
							<div class="col-md-6">
								<label>Descripción: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="far fa-user"></i></span>
									</div>
									<input type="text" class="form-control" id="descripcion">
								</div>
							</div>
							<div class="col-md-2">
								<label>Precio Unitario: </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="far fa-user"></i></span>
									</div>
									<input type="text" class="form-control" id="preciounitario">
								</div>
							</div>
							<div class="col-md-2">
								<label>Agregar </label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<button type="button" class="btn btn-warning"
											onclick="agregar()">
											<i class="fas fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
						</div>

						<br>
						<div class="row" id="div-tabladetallepago" style="display: none;">
							<small class="text-secondary"><b>Detalle pago</b></small>
							<table class="table table-striped" id="tabledetallepago">
								<thead>
									<tr>
										<th scope="col">Cantidad</th>
										<th scope="col">Descripción</th>
										<th scope="col">P.U.</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>

						</div>

						<div class="row">
							<div class="col-md-4">
								<label>Descuento: </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="descuento">
									<div class="input-group-append">
										<button type="button" class="btn btn-info"
											onclick="calcularPago()">Calcular</button>
									</div>
								</div>
							</div>
						</div>

						<div id="resumenPago" style="display: none;" class="center-block">
							RESUMEN
							<div class="card" style="width: 18rem;">
								<ul class="list-group list-group-flush">
									<li class="list-group-item">Subtotal: <input type="text"
										class="form-control" id="subtotal" disabled></li>
									<li class="list-group-item">Descuento: <input type="text"
										class="form-control" id="descuento2" disabled></li>
									<li class="list-group-item"><b>Total: </b><input
										type="text" class="form-control" id="total" disabled></li>
								</ul>
							</div>
							<br>
							<button type="button" class="btn btn-primary"
								onclick="registrarPago()">Registrar Pago</button>
						</div>

						<div class="text-center"></div>
					</div>
				</div>
			</div>



			<!-- modal -->
			<div class="modal fade" id="modalListaClientes" tabindex="-1" role="">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="card">
							<div class="card-header">Elegir el cliente</div>
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

	<script src="../../js/pago.js"></script>
</body>
</html>