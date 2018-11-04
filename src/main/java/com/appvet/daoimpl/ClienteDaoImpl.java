package com.appvet.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.appvet.dao.ClienteDao;
import com.appvet.entities.Cliente;
import com.appvet.repository.ClienteRepository;

@Repository
@Transactional
public class ClienteDaoImpl implements ClienteDao{
	
	@Autowired
	ClienteRepository clienteRepository;

	@Override
	public List<Cliente> findAllCliente() {
		return (List<Cliente>) clienteRepository.findAll();
	}

	@Override
	public void saveOrUpdate(Cliente cliente) {
		clienteRepository.save(cliente);		
	}

	@Override
	public void deleteCliente(int id) {
		clienteRepository.deleteById(id);
	}

	@Override
	public Cliente getOneCliente(int id) {
		return clienteRepository.findById(id).get(); 
	}

}
