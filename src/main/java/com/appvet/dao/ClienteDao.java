package com.appvet.dao;

import java.util.List;
import com.appvet.entities.Cliente;

public interface ClienteDao {
	public List<Cliente> findAllCliente();
	public void saveOrUpdate(Cliente cliente);
	public void deleteCliente(int id);
}
