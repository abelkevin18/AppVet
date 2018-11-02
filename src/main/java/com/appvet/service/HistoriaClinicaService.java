package com.appvet.service;

import java.util.List;

import com.appvet.entities.Historiaclinica;

public interface HistoriaClinicaService {
	public List<Historiaclinica> getAllHC();
	public void saveHC(Historiaclinica hc);
	public void deleteHC(int id);
}
