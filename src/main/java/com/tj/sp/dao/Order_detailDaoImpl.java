package com.tj.sp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Order_detail;
@Repository
public class Order_detailDaoImpl implements Order_detailDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int insertOrder_detail(Order_detail order_detail) {
		return sessionTemplate.insert("insertOrder_detail", order_detail);
	}

}
