package com.appvet.controller;

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

import com.appvet.entities.Usuario;
import com.appvet.service.UsuarioService;

@Controller
@RequestMapping(value = "/usuario")
public class UsuarioController {
	@Autowired
	UsuarioService usuarioService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("user/registrar");
		List<Usuario> users = usuarioService.getAllUsers();
		model.addObject("users", users);

		return model;
	}

	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getSaved(Usuario usuario) {
		Map<String, Object> map = new HashMap<String, Object>();
		/*System.out.println("hola");

		System.out.println("peticion ajax post:" + "" + usuario.getNombre() + "; " + usuario.getApellido() + "; "
				+ usuario.getDni() + "; " + usuario.getDireccion() + "; " + usuario.getTelefono() + "; "
				+ usuario.getNombreusuario() + "; " + usuario.getPassword() + "; " + usuario.getEstado() + "; "
				+ usuario.getCargo());*/

		/*Usuario u = new Usuario();
		u.setNombre(usuario.getNombre());
		u.setApellido(usuario.getApellido());
		u.setDni(usuario.getDni());
		u.setDireccion(usuario.getDireccion());
		u.setTelefono(usuario.getTelefono());
		u.setNombreusuario(usuario.getNombreusuario());
		u.setPassword(usuario.getPassword());
		u.setEstado(usuario.getEstado());
		u.setCargo(usuario.getCargo());*/

		usuarioService.saveOrUpdate(usuario);
		return map;
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteUser(HttpServletRequest request, HttpSession session,
			ModelMap modelMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		int idusuario = Integer.parseInt(request.getParameter("idusuario"));
		usuarioService.deleteUser(idusuario);
		map.put("status", "1");
		return map;
	}

}
