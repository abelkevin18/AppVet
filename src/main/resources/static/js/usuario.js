$(document).ready(function() {
	$('#sidebarCollapse').on('click', function() {
		$('#sidebar').toggleClass('active');
	});

});


function saveUser() {

	var nombre = $("#nombre").val();
	var apellido = $("#apellido").val();
	var dni = $("#dni").val();
	var direccion = $("#direccion").val();
	var telefono = $("#telefono").val();
	var nombreusuario = $("#nombreusuario").val();
	var clave1 = $("#clave1").val();
	var clave2 = $("#clave2").val();

	var estado = $("#estado").val();
	var cargo = $("#cargo").val();

	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"nombre" : nombre,
			"apellido" : apellido,
			"dni" : dni,
			"direccion" : direccion,
			"telefono" : telefono,
			"nombreusuario" : nombreusuario,
			"password" : clave1,
			"estado" : estado,
			"cargo" : cargo
		},
		success : function(response) {
			// alert(response.message);
		}
	});
};

$(document).ready(function() {
	$('#tableUsuarios').DataTable({
		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
		}
	});

});

$(document).on("click", ".editarUsuario", function() {
	var idusuario = $(this).attr("id");
	// console.log(id);
	var nombre = "";
	$(this).parents("tr").find(".td01").each(function() {
		nombre += $(this).html();
	});

	var apellido = "";
	$(this).parents("tr").find(".td02").each(function() {
		apellido += $(this).html();
	});

	// console.log(nombre+" "+apellido);

	var dni;
	var direccion;
	var telefono;
	var nombreusuario;
	var estado;
	var cargo;

	$(this).parents("tr").find(".td03").each(function() {
		dni = $(this).html();
	});

	$(this).parents("tr").find(".td04").each(function() {
		direccion = $(this).html();
	});

	$(this).parents("tr").find(".td05").each(function() {
		telefono = $(this).html();
	});

	$(this).parents("tr").find(".td06").each(function() {
		nombreusuario = $(this).html();
	});

	$(this).parents("tr").find(".td07").each(function() {
		estado = $(this).html();
	});

	$(this).parents("tr").find(".td08").each(function() {
		cargo = $(this).html();
	});

	$("#idusuario_").val(idusuario);
	$("#nombre_").val(nombre);
	$("#apellido_").val(apellido);
	$("#dni_").val(dni);
	$("#direccion_").val(direccion);
	$("#telefono_").val(telefono);
	$("#nombreusuario_").val(nombreusuario);
	$("#estado_").val(estado);
	$("#cargo_").val(cargo);

});

function editarUsuario() {
	var idusuario = $("#idusuario_").val();
	var nombre = $("#nombre_").val();
	var apellido = $("#apellido_").val();
	var dni = $("#dni_").val();
	var direccion = $("#direccion_").val();
	var telefono = $("#telefono_").val();
	var nombreusuario = $("#nombreusuario_").val();
	var estado = $("#estado_").val();
	var cargo = $("#cargo_").val();

	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"idusuario" : idusuario,
			"nombre" : nombre,
			"apellido" : apellido,
			"dni" : dni,
			"direccion" : direccion,
			"telefono" : telefono,
			"nombreusuario" : nombreusuario,
			"estado" : estado,
			"cargo" : cargo
		},
		success : function(response) {
			// alert(response.message);
		}
	});
};

$(document).on("click", ".deleteUsuario", function() {
	var idusuario = $(this).attr("id");

	if (confirm("Desea eliminar este registro?")) {
		$.ajax({
			url : 'deleteUser',
			type : 'POST',
			data : {
				"idusuario" : idusuario
			},
			success : function(responseJson) {
				// alert(response.message);
				var message = responseJson.status;
				// console.log(message+"'");
				if (message === "1") {
					alert("Registro eliminado correctamente.");
					location.reload();
				} else {
					// $(".oculto").show();
				}
			}
		});
	} else {

	}

});