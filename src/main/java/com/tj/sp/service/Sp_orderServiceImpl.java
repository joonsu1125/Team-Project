package com.tj.sp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.Sp_orderDao;
import com.tj.sp.dto.Sp_order;
@Service
public class Sp_orderServiceImpl implements Sp_orderService {
	@Autowired
	Sp_orderDao sp_orderDao;
	@Override
	public int insertSp_order(Sp_order sp_order) {
		return sp_orderDao.insertSp_order(sp_order);
	}
	@Override
	public int updateSp_order(String ocode) {
		return sp_orderDao.updateSp_order(ocode);
	}

}
