package com.appvet.dao;


import com.appvet.entities.Historiaclinica;;

public interface HistoriaClinicaDao {
	public Historiaclinica getOneHC(int id);
	public void saveHC(Historiaclinica hc);
	public void deleteHC(int id);
}
