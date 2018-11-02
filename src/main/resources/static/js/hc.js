$(document).on("click", ".savehc", function() {
	var idmascota = parseInt($(this).attr("id"));
	
	var motivoconsulta = $("#motivoconsulta").val()
	var temperatura = $("#temperatura").val()
	var frecuenciacardiaca = $("#frecuenciacardiaca").val()
	var frecuenciarespiratoria = $("#frecuenciarespiratoria").val()
	var peso = $("#peso").val()
	var sintomas = $("#sintomas").val()
	var anamnesis = $("#anamnesis").val()
	var diagnosticopresuntivo = $("#diagnosticopresuntivo").val()
	var pruebasclinicas = $("#pruebasclinicas").val()
	var diagnosticodefinitivo = $("#diagnosticodefinitivo").val()
	var plantratamiento = $("#plantratamiento").val()
	var observaciones = $("#observaciones").val()

	
	$.ajax({
		url : 'savehc',
		type : 'POST',
		data : {
			"idmascota" : idmascota,
			"motivoconsulta": motivoconsulta,
			"temperatura": temperatura,
			"frecuenciacardiaca": frecuenciacardiaca,
			"frecuenciarespiratoria": frecuenciarespiratoria,
			"peso": peso,
			"sintomas": sintomas,
			"anamnesis": anamnesis,
			"diagnosticopresuntivo": diagnosticopresuntivo,
			"pruebasclinicas": pruebasclinicas,
			"diagnosticodefinitivo": diagnosticodefinitivo,
			"plantratamiento": plantratamiento,
			"observaciones": observaciones	
		},
		success : function(responseJson) {
		}
	});
});