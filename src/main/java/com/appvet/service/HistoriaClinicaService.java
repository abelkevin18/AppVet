package com.appvet.service;


import com.appvet.entities.Historiaclinica;

public interface HistoriaClinicaService {
	public Historiaclinica getOneHC(int id);
	public Historiaclinica saveHC(Historiaclinica hc);
	public void deleteHC(int id);
}
