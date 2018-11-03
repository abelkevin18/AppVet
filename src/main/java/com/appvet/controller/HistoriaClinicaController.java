package com.appvet.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.appvet.entities.Cliente;
import com.appvet.entities.Detallehistoria;
import com.appvet.entities.Historiaclinica;
import com.appvet.entities.Mascota;
import com.appvet.service.DetalleHistoriaClinicaService;
import com.appvet.service.HistoriaClinicaService;
import com.appvet.service.MascotaService;

@Controller
@RequestMapping(value = "/historiaclinica")
public class HistoriaClinicaController {
	@Autowired
	HistoriaClinicaService historiaClinicaService;

	@Autowired
	MascotaService mascotaService;
	
	@Autowired
	DetalleHistoriaClinicaService detalleHistoriaClinicaService;

	/*
	 * @RequestMapping(value = "/index", method = RequestMethod.GET) public
	 * ModelAndView hcindex() { ModelAndView model = new
	 * ModelAndView("historiaclinica/registrar"); return model; }
	 */

	@RequestMapping(value = "/{idmascota}", method = RequestMethod.GET)
	public ModelAndView showHistoriaClinica(@PathVariable int idmascota) {
		// System.out.println("id: "+idmascota);
		Mascota mascota = mascotaService.getOneMascota(idmascota);
		int valores = mascota.getHistoriaclinicas().size();
		System.out.println(valores);

		// ModelAndView model;
		if (valores == 0) {
			ModelAndView model = new ModelAndView("historiaclinica/registrar");
			model.addObject("mascota", mascota);
			return model;
		} else {
			ModelAndView model = new ModelAndView("historiaclinica/detalle");
			return model;
		}

	}

	@RequestMapping(value = "/savehc", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> saveHC(HttpServletRequest request,
			ModelMap modelMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int idmascota = Integer.parseInt(request.getParameter("idmascota"));
		Mascota mascota = mascotaService.getOneMascota(idmascota);
		
		Historiaclinica historia = new Historiaclinica();
		historia.setMascota(mascota);
		
		Historiaclinica hc02 = historiaClinicaService.saveHC(historia);
		
		//System.out.println(hc02.getIdhistoria());
		
		String motivoconsulta =  request.getParameter("motivoconsulta");
		BigDecimal temperatura = new BigDecimal(request.getParameter("temperatura"));
		String frecuenciacardiaca =  request.getParameter("frecuenciacardiaca");
		String frecuenciarespiratoria =  request.getParameter("frecuenciarespiratoria");
		BigDecimal peso = new BigDecimal(request.getParameter("peso"));
		String sintomas =  request.getParameter("sintomas");
		String anamnesis =  request.getParameter("anamnesis");
		String diagnosticopresuntivo =  request.getParameter("diagnosticopresuntivo");
		String pruebasclinicas =  request.getParameter("pruebasclinicas");
		String diagnosticodefinitivo =  request.getParameter("diagnosticodefinitivo");
		String plantratamiento =  request.getParameter("plantratamiento");
		String observaciones =  request.getParameter("observaciones");
		
		Detallehistoria dh = new Detallehistoria();
		
		dh.setHistoriaclinica(hc02);
		dh.setMotivoconsulta(motivoconsulta);
		dh.setTemperatura(temperatura);
		dh.setFrecuenciacardiaca(Integer.parseInt(frecuenciacardiaca));
		dh.setFrecuenciarespiratoria(Integer.parseInt(frecuenciarespiratoria));
		dh.setPeso(peso);
		dh.setSintomas(sintomas);
		dh.setAnamnesis(anamnesis);
		dh.setDiagnosticopresuntivo(diagnosticopresuntivo);
		dh.setPruebasclinicas(pruebasclinicas);
		dh.setDiagnosticodefinitivo(diagnosticodefinitivo);
		dh.setPlantratamiento(plantratamiento);
		dh.setObservaciones(observaciones);
		
		detalleHistoriaClinicaService.saveDetalleHc(dh);
		
		map.put("status", "1");
		return map;
	}

}
