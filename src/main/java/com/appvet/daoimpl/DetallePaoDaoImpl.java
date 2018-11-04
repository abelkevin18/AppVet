package com.appvet.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.appvet.dao.DetallePagoDao;
import com.appvet.entities.Detallepago;
import com.appvet.repository.DetallePagoRepository;

@Repository
@Transactional
public class DetallePaoDaoImpl implements DetallePagoDao{

	@Autowired
	DetallePagoRepository detallePagoRepository;

	@Override
	public List<Detallepago> getAllDetallepago() {
		// TODO Auto-generated method stub
		return (List<Detallepago>) detallePagoRepository.findAll();
	}

	@Override
	public void saveDetallepago(Detallepago detallePago) {
		// TODO Auto-generated method stub
		detallePagoRepository.save(detallePago);
	}

	@Override
	public void deleteDetallepago(int id) {
		detallePagoRepository.deleteById(id);
		
	}

	@Override
	public Detallepago getOneDetallepago(int id) {
		// TODO Auto-generated method stub
		return detallePagoRepository.findById(id).get() ;
	}
}
