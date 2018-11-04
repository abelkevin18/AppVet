package com.appvet.service;

import java.util.List;

import com.appvet.entities.Cliente;

public interface ClienteService {
	public List<Cliente> findAllCliente();
	public void saveOrUpdate(Cliente cliente);
	public void deleteCliente(int id);
	public Cliente getOneCliente(int id);
}
