package com.appvet.service;

import java.util.List;

import com.appvet.entities.Usuario;

public interface UsuarioService {
	public List<Usuario> getAllUsers();
	public void saveOrUpdate(Usuario usuario);
	public void deleteUser(int id);
}
