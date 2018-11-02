package com.appvet.dao;

import java.util.List;

import com.appvet.entities.Mascota;

public interface MascotaDao {
	public List<Mascota> getAllMascota();
	public void saveMascota(Mascota mascota);
	public void deleteMascota(int id);
	
	public Mascota getOneMascota(int id);
}
