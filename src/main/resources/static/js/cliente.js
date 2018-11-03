$(document).ready(function() {
	$('#tableClientes').DataTable({
		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
		}
	});
	$('#sidebarCollapse').on('click', function() {
		$('#sidebar').toggleClass('active');
	});

});

function saveCliente() {

	var nombre = $("#nombre").val();
	var apellido = $("#apellido").val();
	var dni = $("#dni").val();
	var direccion = $("#direccion").val();
	var telefono = $("#telefono").val();

	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"nombre" : nombre,
			"apellido" : apellido,
			"dni" : dni,
			"direccion" : direccion,
			"telefono" : telefono
		},
		success : function(responseJson) {
			var message = responseJson.status;
			// console.log(message+"'");
			if (message === "1") {
				alert("Registro almacenado correctamente.");
				location.reload();
			} else {
				// $(".oculto").show();
			}
		}
	});
};

$(document).on("click", ".editarCliente", function() {
	var idcliente = $(this).attr("id");
	// console.log(id);
	var nombre = "";
	$(this).parents("tr").find(".td01").each(function() {
		nombre += $(this).html();
	});

	var apellido = "";
	$(this).parents("tr").find(".td02").each(function() {
		apellido += $(this).html();
	});


	var dni;
	var direccion;
	var telefono;


	$(this).parents("tr").find(".td03").each(function() {
		dni = $(this).html();
	});

	$(this).parents("tr").find(".td04").each(function() {
		direccion = $(this).html();
	});

	$(this).parents("tr").find(".td05").each(function() {
		telefono = $(this).html();
	});

	$("#idcliente_").val(idcliente);
	$("#nombre_").val(nombre);
	$("#apellido_").val(apellido);
	$("#dni_").val(dni);
	$("#direccion_").val(direccion);
	$("#telefono_").val(telefono);

});


function editarCliente() {
	var idcliente = $("#idcliente_").val();
	var nombre = $("#nombre_").val();
	var apellido = $("#apellido_").val();
	var dni = $("#dni_").val();
	var direccion = $("#direccion_").val();
	var telefono = $("#telefono_").val();

	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"idcliente" : idcliente,
			"nombre" : nombre,
			"apellido" : apellido,
			"dni" : dni,
			"direccion" : direccion,
			"telefono" : telefono
		},
		success : function(responseJson) {
			var message = responseJson.status;
			if (message === "1") {
				alert("Registro editado correctamente.");
				location.reload();
			} else {
			}
		}
	});
};

$(document).on("click", ".deleteCliente", function() {
	var idcliente = $(this).attr("id");

	if (confirm("Desea eliminar este registro?")) {
		$.ajax({
			url : 'deleteCliente',
			type : 'POST',
			data : {
				"idcliente" : idcliente
			},
			success : function(responseJson) {
				var message = responseJson.status;
				if (message === "1") {
					alert("Registro eliminado correctamente.");
					location.reload();
				} else {
				}
			}
		});
	} else {

	}

});