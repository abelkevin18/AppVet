package com.appvet.dao;

import java.util.List;

import com.appvet.entities.Pago;

public interface PagoDao {
	public List<Pago> getAllPago();
	public Pago savePago(Pago pago);
	public void deletePago(int id);
	public Pago getOnePago(int id);
}
