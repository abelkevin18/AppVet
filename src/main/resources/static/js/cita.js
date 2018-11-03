$(document).ready(function() {
	$('#sidebarCollapse').on('click', function() {
		$('#sidebar').toggleClass('active');
	});
	
	$('#tableCitas').DataTable({
		"language" : {
			"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
		}
	});
});


$(document).on("click", ".elegirMascota", function() {
	var idmascota = $(this).attr("id");
	
	var nombremascota;
	
	$(this).parents("tr").find(".td01").each(function() {
		nombremascota = $(this).html();
	});
	
	$("#nombremascota").val(nombremascota);
	$("#idmascota").val(idmascota);
	var submitBtn = document.getElementById('closeModal');
	if (submitBtn) {
		submitBtn.click();
	}
});

function saveCita(){
	var idmascota = $("#idmascota").val();
	var fechacita = $("#fechacita").val();
	var lugar = $("#lugar").val();
	var especificaciones = $("#especificaciones").val();
	
	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"mascota.idmascota" : parseInt(idmascota),
			"fechacita" : fechacita,
			"lugar" : lugar,
			"especificaciones" : especificaciones
		},
		success : function(responseJson) {
			var message = responseJson.status;
			if (message === "1") {
				alert("Registro almacenado correctamente.");
				location.reload();
			}
		}
	});

}
;