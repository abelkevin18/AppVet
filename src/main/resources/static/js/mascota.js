$(document).ready(function() {
	$('#tableMascotas').DataTable({
		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
		}
	});

	$('#tableClientes').DataTable({
		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
		}
	});

});

function saveMascota() {

	var idcliente = $("#idcliente").val();
	var nombremascota = $("#nombremascota").val();
	var especie = $("#especie").val();
	var raza = $("#raza").val();
	var fechanacimiento = $("#fechanacimiento").val();
	var sexo = $("#sexo").val();
	var caracteristicas = $("#caracteristicas").val();

	//console.log(idcliente);

	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"cliente.idcliente" : parseInt(idcliente),
			"nombremascota" : nombremascota,
			"especie" : especie,
			"raza" : raza,
			"fechanacimiento" : fechanacimiento,
			"sexo" : sexo,
			"caracteristicas" : caracteristicas
		},
		success : function(responseJson) {
			var message = responseJson.status;
			if (message === "1") {
				alert("Registro almacenado correctamente.");
				location.reload();
			}
		}
	});
};

$(document).on("click", ".elegirCliente", function() {
	var idcliente = $(this).attr("id");
	var nombre = "";
	$(this).parents("tr").find(".td01").each(function() {
		nombre += $(this).html();
	});
	var apellido = "";
	$(this).parents("tr").find(".td02").each(function() {
		apellido += $(this).html();
	});

	var statusshow = $("#showlistcliente").val();

	if (statusshow === "show01") {
		$("#propietario").val(nombre + " " + apellido);
		$("#idcliente").val(idcliente);
	}
	if (statusshow === "show02") {
		$("#propietario_").val(nombre + " " + apellido);
		$("#idcliente_").val(idcliente);
	}

	var submitBtn = document.getElementById('closeModal');
	if (submitBtn) {
		submitBtn.click();
	}
});

$(document).on("click", ".showclientes", function() {
	var id = $(this).attr("id");
	// console.log(id);
	$("#showlistcliente").val(id)

});

$(document).on("click", ".editarMascota", function() {
	var idcliente = $(this).attr("name");
	var idmascota = $(this).attr("id");
	
	var nombremascota;
	var especie;
	var raza;
	var fechanacimiento;
	var sexo;
	var caracteristicas;
	var propietario;
	
	$(this).parents("tr").find(".td01").each(function() {
		nombremascota = $(this).html();
	});
	
	$(this).parents("tr").find(".td02").each(function() {
		especie = $(this).html();
	});
	$(this).parents("tr").find(".td03").each(function() {
		raza = $(this).html();
	});
	$(this).parents("tr").find(".td08").each(function() {
		fechanacimiento = $(this).html();
	});
	$(this).parents("tr").find(".td05").each(function() {
		sexo = $(this).html();
	});
	$(this).parents("tr").find(".td06").each(function() {
		caracteristicas = $(this).html();
	});
	$(this).parents("tr").find(".td07").each(function() {
		propietario = $(this).html();
	});
	
	$("#nombremascota_").val(nombremascota);
	$("#idmascota_").val(idmascota);
	$("#propietario_").val(propietario);
	$("#idcliente_").val(idcliente);
	$("#especie_").val(especie);
	$("#raza_").val(raza);
	
	$("#sexo_").val(sexo);
	$("#caracteristicas_").val(caracteristicas);
	$("#fechanacimiento_").val(fechanacimiento);

});


function editarMascota(){
	var idcliente = $("#idcliente_").val();
	var nombremascota = $("#nombremascota_").val();
	var especie = $("#especie_").val();
	var raza = $("#raza_").val();
	var fechanacimiento = $("#fechanacimiento_").val();
	var sexo = $("#sexo_").val();
	var caracteristicas = $("#caracteristicas_").val();
	
	var idmascota = $("#idmascota_").val();
	
	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"idmascota": parseInt(idmascota),
			"cliente.idcliente" : parseInt(idcliente),
			"nombremascota" : nombremascota,
			"especie" : especie,
			"raza" : raza,
			"fechanacimiento" : fechanacimiento,
			"sexo" : sexo,
			"caracteristicas" : caracteristicas
		},
		success : function(responseJson) {
			var message = responseJson.status;
			if (message === "1") {
				alert("Registro editado correctamente.");
				location.reload();
			}
		}
	});
}
;

$(document).on("click", ".deleteMascota", function() {
	var idmascota = $(this).attr("id");

	if (confirm("Desea eliminar este registro?")) {
		$.ajax({
			url : 'deleteMascota',
			type : 'POST',
			data : {
				"idmascota" : idmascota
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
	}

});

$(document).on("click", ".showhc", function() {
	var idmascota = parseInt($(this).attr("id"));
	$.ajax({
		url : 'showhc/'+idmascota,
		type : 'POST',
		data : {
		},
		success : function(responseJson) {
		}
	});
});