package com.appvet.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.appvet.dao.ClienteDao;
import com.appvet.entities.Cliente;
import com.appvet.service.ClienteService;

@Service
public class ClienteServiceImpl implements ClienteService{
	
	@Autowired
	ClienteDao clienteDao;

	@Override
	public List<Cliente> findAllCliente() {
		// TODO Auto-generated method stub
		return clienteDao.findAllCliente();
	}

	@Override
	public void saveOrUpdate(Cliente cliente) {
		clienteDao.saveOrUpdate(cliente);
	}

	@Override
	public void deleteCliente(int id) {
		clienteDao.deleteCliente(id);
		
	}

	@Override
	public Cliente getOneCliente(int id) {
		return clienteDao.getOneCliente(id);
	}

}
