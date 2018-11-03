package com.appvet.dao;

import java.util.List;

import com.appvet.entities.Cita;

public interface CitaDao {
	public List<Cita> getAllCitas();
	public void saveCita(Cita cita);
	public void deleteCita(int id);
	public Cita getOneCita(int id);
}
