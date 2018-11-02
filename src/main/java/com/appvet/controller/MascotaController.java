package com.appvet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.appvet.entities.Cliente;
import com.appvet.entities.Mascota;
import com.appvet.service.ClienteService;
import com.appvet.service.MascotaService;

@Controller
@RequestMapping(value = "/mascota")
public class MascotaController {
	@Autowired
	MascotaService mascotaService;
	
	@Autowired
	ClienteService clienteService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView listMascotas() {
		ModelAndView model = new ModelAndView("mascota/index");
		List<Mascota> mascotas = mascotaService.getAllMascota();
		List<Cliente> clientes = clienteService.findAllCliente();
		model.addObject("clientes", clientes);
		model.addObject("mascotas", mascotas);

		return model;
	}
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> SaveMascota(Mascota mascota) {
		Map<String, Object> map = new HashMap<String, Object>();
		mascotaService.saveMascota(mascota);
		map.put("status", "1");
		return map;
	}

}
