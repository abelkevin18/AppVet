package com.appvet.service;

import java.util.List;

import com.appvet.entities.Pago;

public interface PagoService {
	public List<Pago> getAllPago();
	public Pago savePago(Pago pago);
	public void deletePago(int id);
	public Pago getOnePago(int id);

}
