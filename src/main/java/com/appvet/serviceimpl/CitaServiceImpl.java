package com.appvet.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.appvet.dao.CitaDao;
import com.appvet.entities.Cita;
import com.appvet.service.CitaService;

@Service
public class CitaServiceImpl implements CitaService{
	
	@Autowired
	CitaDao citaDao;

	@Override
	public List<Cita> getAllCitas() {
		// TODO Auto-generated method stub
		return citaDao.getAllCitas();
	}

	@Override
	public void saveCita(Cita cita) {
		citaDao.saveCita(cita);
	}

	@Override
	public void deleteCita(int id) {
		citaDao.deleteCita(id);
	}

	@Override
	public Cita getOneCita(int id) {
		return citaDao.getOneCita(id);
	}

}
