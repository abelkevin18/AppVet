package com.appvet.dao;

import com.appvet.entities.Detallehistoria;;

public interface DetalleHistoriaClinicaDao {
	
	public void saveDetalleHc(Detallehistoria detallehistoria);
	public void deleteDetalleHc(int id);
	public Detallehistoria getOneDetalleHc(int id);
}
