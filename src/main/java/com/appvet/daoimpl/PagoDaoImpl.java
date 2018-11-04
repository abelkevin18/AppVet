package com.appvet.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.appvet.dao.PagoDao;
import com.appvet.entities.Pago;
import com.appvet.repository.PagoRepository;

@Repository
@Transactional
public class PagoDaoImpl implements PagoDao {
	
	@Autowired
	PagoRepository pagoRepository;

	@Override
	public List<Pago> getAllPago() {
		return (List<Pago>) pagoRepository.findAll();
	}

	@Override
	public Pago savePago(Pago pago) {
		pagoRepository.save(pago);
		return pago;
	}

	@Override
	public void deletePago(int id) {
		pagoRepository.deleteById(id);
	}

	@Override
	public Pago getOnePago(int id) {
		return pagoRepository.findById(id).get();
	}



}
