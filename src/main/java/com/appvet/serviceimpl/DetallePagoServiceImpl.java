package com.appvet.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.appvet.dao.DetallePagoDao;
import com.appvet.entities.Detallepago;
import com.appvet.service.DetallePagoService;

@Service
public class DetallePagoServiceImpl implements DetallePagoService{

	@Autowired
	DetallePagoDao detallePagoDao;
	
	@Override
	public List<Detallepago> getAllDetallepago() {
		// TODO Auto-generated method stub
		return detallePagoDao.getAllDetallepago();
	}

	@Override
	public void saveDetallepago(Detallepago detallePago) {
		// TODO Auto-generated method stub
		detallePagoDao.saveDetallepago(detallePago);
	}

	@Override
	public void deleteDetallepago(int id) {
		detallePagoDao.deleteDetallepago(id);
		
	}

	@Override
	public Detallepago getOneDetallepago(int id) {
		// TODO Auto-generated method stub
		return detallePagoDao.getOneDetallepago(id);
	}

}
