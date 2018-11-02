package com.appvet.service;

import com.appvet.entities.Detallehistoria;

public interface DetalleHistoriaClinicaService {
	public void saveDetalleHc(Detallehistoria detallehistoria);
	public void deleteDetalleHc(int id);
	public Detallehistoria getOneDetalleHc(int id);
}
