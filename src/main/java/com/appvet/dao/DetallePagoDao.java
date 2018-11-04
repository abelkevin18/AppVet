package com.appvet.dao;

import java.util.List;

import com.appvet.entities.Detallepago;;

public interface DetallePagoDao {
	public List<Detallepago> getAllDetallepago();
	public void saveDetallepago(Detallepago detallePago);
	public void deleteDetallepago(int id);
	public Detallepago getOneDetallepago(int id);
}
