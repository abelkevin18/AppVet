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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.appvet.entities.Cliente;
import com.appvet.service.ClienteService;

@Controller
@RestController
@RequestMapping(value = "/cliente")
public class ClienteController {
	
	@Autowired
	ClienteService clienteService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("cliente/index");
		List<Cliente> clientes = clienteService.findAllCliente();
		model.addObject("clientes", clientes);

		return model;
	}
	
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> SaveCliente(Cliente cliente) {
		Map<String, Object> map = new HashMap<String, Object>();
		clienteService.saveOrUpdate(cliente);
		map.put("status", "1");
		return map;
	}
	
	@RequestMapping(value = "/deleteCliente", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteUser(HttpServletRequest request, HttpSession session,
			ModelMap modelMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		int idcliente = Integer.parseInt(request.getParameter("idcliente"));
		clienteService.deleteCliente(idcliente);
		map.put("status", "1");
		return map;
	}
	
	@GetMapping("/list")
	public List<Cliente> getCustomers() {
		return clienteService.findAllCliente();
	}
}
