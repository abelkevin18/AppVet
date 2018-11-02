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
	public List<Historiaclinica> getAllHC() {
		return historiaClinicaDao.getAllHC();
	}

	@Override
	public void saveHC(Historiaclinica hc) {
		historiaClinicaDao.saveHC(hc);
	}

	@Override
	public void deleteHC(int id) {
		historiaClinicaDao.deleteHC(id);
	}

}
