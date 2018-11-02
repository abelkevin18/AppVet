package com.appvet.daoimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.appvet.dao.DetalleHistoriaClinicaDao;
import com.appvet.entities.Detallehistoria;
import com.appvet.repository.DetalleHistoriaClinicaRepository;

@Repository
@Transactional
public class DetalleHistoriaClinicaDaoImpl implements DetalleHistoriaClinicaDao{

	@Autowired
	DetalleHistoriaClinicaRepository detalleHistoriaClinicaRepository;
	
	@Override
	public void saveDetalleHc(Detallehistoria detallehistoria) {
		detalleHistoriaClinicaRepository.save(detallehistoria);
	}

	@Override
	public void deleteDetalleHc(int id) {	
		detalleHistoriaClinicaRepository.deleteById(id);
	}

	@Override
	public Detallehistoria getOneDetalleHc(int id) {
		return detalleHistoriaClinicaRepository.findById(id).get();
	}

}
