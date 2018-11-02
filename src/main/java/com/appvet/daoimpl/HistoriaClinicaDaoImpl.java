package com.appvet.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.appvet.dao.HistoriaClinicaDao;
import com.appvet.entities.Historiaclinica;
import com.appvet.repository.HistoriaClinicaRepository;

@Repository
@Transactional
public class HistoriaClinicaDaoImpl implements HistoriaClinicaDao{
	
	@Autowired
	HistoriaClinicaRepository historiaClinicaRepository;

	@Override
	public List<Historiaclinica> getAllHC() {
		return (List<Historiaclinica>) historiaClinicaRepository.findAll();
	}

	@Override
	public void saveHC(Historiaclinica hc) {
		historiaClinicaRepository.save(hc);
		
	}

	@Override
	public void deleteHC(int id) {
		historiaClinicaRepository.deleteById(id);
		
	}

}
