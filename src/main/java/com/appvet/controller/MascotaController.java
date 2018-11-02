package com.appvet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.appvet.entities.Cliente;
import com.appvet.entities.Mascota;
import com.appvet.service.ClienteService;
import com.appvet.service.MascotaService;

@Controller
@RestController
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
	
	@GetMapping("/list")
	public List<Mascota> getAllMascotas(){
		return mascotaService.getAllMascota();
	}
	
	@RequestMapping(value = "/deleteMascota", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteMascota(HttpServletRequest request, HttpSession session,
			ModelMap modelMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		int idmascota = Integer.parseInt(request.getParameter("idmascota"));
		mascotaService.deleteMascota(idmascota);
		map.put("status", "1");
		return map;
	}
	
	
	

}
