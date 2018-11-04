package com.appvet.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.appvet.dao.PagoDao;
import com.appvet.entities.Pago;
import com.appvet.service.PagoService;

@Repository
public class PagoServiceImpl implements PagoService {
	@Autowired
	PagoDao pagoDao;

	@Override
	public List<Pago> getAllPago() {
		
		return pagoDao.getAllPago();
	}

	@Override
	public Pago savePago(Pago pago) {
		return pagoDao.savePago(pago);
		
	}

	@Override
	public void deletePago(int id) {
		pagoDao.deletePago(id);
		
	}

	@Override
	public Pago getOnePago(int id) {
		// TODO Auto-generated method stub
		return pagoDao.getOnePago(id);
	}
}
