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

	$("#cliente").val(nombre + " " + apellido);
	$("#idcliente").val(idcliente);

	var submitBtn = document.getElementById('closeModal');
	if (submitBtn) {
		submitBtn.click();
	}
});

function agregar() {
	var cantidad = $("#cantidad").val();
	var descripcion = $("#descripcion").val();
	var preciounitario = $("#preciounitario").val();

	tbody = "<tr>\n\
        <td>"
			+ cantidad
			+ "</th>\n\
        <td>"
			+ descripcion
			+ "</td>\n\
        <td>"
			+ preciounitario
			+ "</td>\n\
        <td><button class=\"btn btn-danger borrar\"><i class=\"fas fa-trash-alt\"></i></button></td>\n\
    </tr>";
	$("#tabledetallepago tbody").append(tbody);
	$('#cantidad').val("");
	$('#descripcion').val("");
	$('#preciounitario').val("");
	$('#div-tabladetallepago').show();
};

$(function() {
	$(document).on('click', '.borrar', function(event) {
		event.preventDefault();
		$(this).closest('tr').remove();
	});
});

function calcularPago() {

	var descuento = $('#descuento').val();
	var subtotal = 0.0;
	var total;
	var index = parseInt(document.getElementById("tabledetallepago").rows.length);

	var cantidad = 0.0;
	var preciounitario = 0.0;

	for (i = 1; i < index; i++) {
		cantidad = document.getElementById("tabledetallepago").rows[i].cells[0].innerText;
		preciounitario = document.getElementById("tabledetallepago").rows[i].cells[2].innerText;
		subtotal += parseFloat(cantidad) * parseFloat(preciounitario);
	}

	total = subtotal - parseFloat(descuento);

	$('#descuento2').val(descuento);
	$('#total').val(total);
	$('#subtotal').val(subtotal);

	$("#resumenPago").show();

	/*
	 * console.log("subtotal: " + subtotal); console.log("descuento: " +
	 * descuento); console.log("total: " + total);
	 */

};

function registrarPago() {

	var idusuario = 4;
	var idcliente = $('#idcliente').val();
	var fechapago = $('#fechapago').val();
	var subtotal = $('#subtotal').val();
	var descuento = $('#descuento').val();
	var total = $('#total').val();

	var cantidad;
	var descripcion;
	var preciounitario;
	
	console.log(idcliente+ " " +fechapago+ " " +subtotal+ " " +descuento+ " " +total);

	/*var index = parseInt(document.getElementById("tabledetallepago").rows.length);

	for (i = 1; i < index; i++) {
		cantidad = document.getElementById("tabledetallepago").rows[i].cells[0].innerText;
		descripcion = document.getElementById("tabledetallepago").rows[i].cells[1].innerText;
		preciounitario = document.getElementById("tabledetallepago").rows[i].cells[2].innerText;
	}*/

	$.ajax({
		url : 'saveOrUpdate',
		type : 'POST',
		data : {
			"usuario.idusuario" : parseInt(idusuario),
			"cliente.idcliente" : parseInt(idcliente),
			"fechapago" : fechapago,
			"subtotal" : subtotal,
			"descuento" : descuento,
			"total" : total
		},
		success : function(responseJson) {
			console.log("exito");
		}
	});

};