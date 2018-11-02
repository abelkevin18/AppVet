package com.appvet.service;

import java.util.List;

import com.appvet.entities.Mascota;

public interface MascotaService {
	public List<Mascota> getAllMascota();
	public void saveMascota(Mascota mascota);
	public void deleteMascota(int id);
}
