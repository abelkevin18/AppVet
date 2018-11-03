package com.appvet.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.appvet.dao.CitaDao;
import com.appvet.entities.Cita;
import com.appvet.repository.CitaRepository;

@Repository
@Transactional
public class CitaDaoImpl implements CitaDao{
	
	@Autowired
	CitaRepository citaRepository;

	@Override
	public List<Cita> getAllCitas() {
		return (List<Cita>)citaRepository.findAll();
	}

	@Override
	public void saveCita(Cita cita) {
		citaRepository.save(cita);
	}

	@Override
	public void deleteCita(int id) {
		citaRepository.deleteById(id);
	}

	@Override
	public Cita getOneCita(int id) {
		return citaRepository.findById(id).get();
	}

}
