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

import com.appvet.entities.Cita;
import com.appvet.entities.Mascota;
import com.appvet.service.CitaService;
import com.appvet.service.MascotaService;

@Controller
@RequestMapping(value = "/cita")
public class CitaController {
	
	@Autowired
	MascotaService mascotaService;
	
	@Autowired
	CitaService citaService;
	

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView citaindex() {
		ModelAndView model = new ModelAndView("cita/index");
		
		List<Mascota> mascotas = mascotaService.getAllMascota();
		List<Cita> citas = citaService.getAllCitas();
		
		model.addObject("mascotas", mascotas);
		model.addObject("citas", citas);
		return model;
	}
	
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> saveCita(Cita cita) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		citaService.saveCita(cita);
		map.put("status", "1");
		return map;
	}
	
	
	
	
	
}
