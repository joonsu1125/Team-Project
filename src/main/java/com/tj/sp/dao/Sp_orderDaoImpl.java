package com.tj.sp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Sp_order;

@Repository
public class Sp_orderDaoImpl implements Sp_orderDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertSp_order(Sp_order sp_order) {
		return sessionTemplate.insert("insertSp_order", sp_order);
	}
	@Override
	public int updateSp_order(String ocode) {
		return sessionTemplate.update("updateSp_order", ocode);
	}

}
