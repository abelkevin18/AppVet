package com.appvet.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.appvet.entities.Cliente;
import com.appvet.entities.Detallehistoria;
import com.appvet.entities.Historiaclinica;
import com.appvet.entities.Mascota;
import com.appvet.entities.Pago;
import com.appvet.entities.Usuario;
import com.appvet.service.ClienteService;
import com.appvet.service.PagoService;
import com.appvet.service.UsuarioService;

@Controller
@RequestMapping(value = "/pago")
public class PagoController {
	@Autowired
	PagoService pagoService;

	@Autowired
	ClienteService clienteService;

	@Autowired
	UsuarioService usuarioService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView listMascotas() {
		ModelAndView model = new ModelAndView("pago/index");
		List<Cliente> clientes = clienteService.findAllCliente();
		model.addObject("clientes", clientes);
		return model;
	}

	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> savePago(HttpServletRequest request, ModelMap modelMap) {
		Map<String, Object> map = new HashMap<String, Object>();

		Pago pago = new Pago();

		int idusuario = Integer.parseInt(request.getParameter("usuario.idusuario"));
		int idcliente = Integer.parseInt(request.getParameter("cliente.idcliente"));
		BigDecimal subtotal = new BigDecimal(request.getParameter("subtotal"));
		BigDecimal total = new BigDecimal(request.getParameter("total"));
		BigDecimal descuento = new BigDecimal(request.getParameter("descuento"));

		Usuario usuario = usuarioService.getOneUsuario(idusuario);
		pago.setUsuario(usuario);
		Cliente cliente = clienteService.getOneCliente(idcliente);
		pago.setCliente(cliente);

		pago.setSubtotal(subtotal);
		pago.setDescuento(descuento);
		pago.setTotal(total);

		try {
			java.util.Date fecha1 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechapago"));
			pago.setFechapago(new java.sql.Date(fecha1.getTime()));
		} catch (ParseException e) {
			System.out.println("Error en la fecha-->> " + e);
		}

		Pago pago02 = pagoService.savePago(pago);

		map.put("status", "1");
		return map;
	}
}
