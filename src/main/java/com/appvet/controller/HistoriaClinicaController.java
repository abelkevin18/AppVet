package com.appvet.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.appvet.entities.Cliente;
import com.appvet.entities.Mascota;
import com.appvet.service.HistoriaClinicaService;

@Controller
@RequestMapping(value = "/historiaclinica")
public class HistoriaClinicaController {
	@Autowired
	HistoriaClinicaService historiaClinicaService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView hcindex() {
		ModelAndView model = new ModelAndView("historiaclinica/registrar");
		return model;
	}
	@RequestMapping(value = "/{idmascota}", method = RequestMethod.GET)
	public ModelAndView showHistoriaClinica(@PathVariable int idmascota) {
		//System.out.println("id: "+idmascota);
		ModelAndView model = new ModelAndView("historiaclinica/registrar");
		model.addObject("idmascota", idmascota);
		return model;
	}	

}
