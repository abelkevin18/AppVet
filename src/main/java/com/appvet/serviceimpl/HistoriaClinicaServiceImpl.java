package com.appvet.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.appvet.dao.HistoriaClinicaDao;
import com.appvet.entities.Historiaclinica;
import com.appvet.service.HistoriaClinicaService;

@Service
public class HistoriaClinicaServiceImpl implements HistoriaClinicaService {

	@Autowired
	HistoriaClinicaDao historiaClinicaDao;
	
	@Override
	public Historiaclinica getOneHC(int id) {
		return historiaClinicaDao.getOneHC(id);
	}

	@Override
	public Historiaclinica saveHC(Historiaclinica hc) {
		return historiaClinicaDao.saveHC(hc);
	}

	@Override
	public void deleteHC(int id) {
		historiaClinicaDao.deleteHC(id);
	}

	

}
