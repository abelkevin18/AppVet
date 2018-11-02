package com.appvet.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.appvet.dao.MascotaDao;
import com.appvet.entities.Mascota;
import com.appvet.repository.MascotaRepository;


@Repository
@Transactional
public class MascotaDaoImpl implements MascotaDao {

	@Autowired
	MascotaRepository mascotaRepository;
	
	@Override
	public List<Mascota> getAllMascota() {
		return (List<Mascota>) mascotaRepository.findAll();
	}

	@Override
	public void saveMascota(Mascota mascota) {
		mascotaRepository.save(mascota);
		
	}

	@Override
	public void deleteMascota(int id) {
		mascotaRepository.deleteById(id);
	}

	@Override
	public Mascota getOneMascota(int id) {
		return mascotaRepository.findById(id).get();
	}

}
