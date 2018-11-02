package com.appvet.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.appvet.dao.MascotaDao;
import com.appvet.entities.Mascota;
import com.appvet.service.MascotaService;

@Service
public class MascotaServiceImpl implements MascotaService {
	@Autowired
	MascotaDao mascotaDao;

	@Override
	public List<Mascota> getAllMascota() {
		return mascotaDao.getAllMascota();
	}

	@Override
	public void saveMascota(Mascota mascota) {
		mascotaDao.saveMascota(mascota);
	}

	@Override
	public void deleteMascota(int id) {
		mascotaDao.deleteMascota(id);
	}

}
