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

	console.log(idcliente);

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


});

