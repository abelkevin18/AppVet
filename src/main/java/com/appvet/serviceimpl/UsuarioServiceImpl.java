package com.appvet.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.appvet.entities.Article;
import com.appvet.entities.Usuario;
import com.appvet.repository.UsuarioRepository;
import com.appvet.service.UsuarioService;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService{
	
	@Autowired
	UsuarioRepository usuarioRepository;

	@Override
	public List<Usuario> getAllUsers() {
		return (List<Usuario>) usuarioRepository.findAll();
	}

	@Override
	public void saveOrUpdate(Usuario usuario) {
		usuarioRepository.save(usuario);
		
	}

	@Override
	public void deleteUser(int id) {
		usuarioRepository.deleteById(id);
	}

}
