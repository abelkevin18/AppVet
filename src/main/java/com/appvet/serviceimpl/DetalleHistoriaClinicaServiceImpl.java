package com.appvet.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.appvet.dao.DetalleHistoriaClinicaDao;
import com.appvet.entities.Detallehistoria;
import com.appvet.service.DetalleHistoriaClinicaService;

@Service
public class DetalleHistoriaClinicaServiceImpl implements DetalleHistoriaClinicaService{
	
	@Autowired
	DetalleHistoriaClinicaDao detalleHistoriaClinicaDao;

	@Override
	public void saveDetalleHc(Detallehistoria detallehistoria) {
		detalleHistoriaClinicaDao.saveDetalleHc(detallehistoria);
	}

	@Override
	public void deleteDetalleHc(int id) {
		detalleHistoriaClinicaDao.deleteDetalleHc(id);
	}

	@Override
	public Detallehistoria getOneDetalleHc(int id) {
		return detalleHistoriaClinicaDao.getOneDetalleHc(id);
	}

}
