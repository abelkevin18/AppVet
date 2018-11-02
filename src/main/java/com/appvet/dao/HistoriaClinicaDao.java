package com.appvet.dao;

import java.util.List;

import com.appvet.entities.Historiaclinica;;

public interface HistoriaClinicaDao {
	public List<Historiaclinica> getAllHC();
	public void saveHC(Historiaclinica hc);
	public void deleteHC(int id);
}
