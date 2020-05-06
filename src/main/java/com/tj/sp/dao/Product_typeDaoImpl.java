package com.tj.sp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Product_type;
@Repository
public class Product_typeDaoImpl implements Product_typeDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Product_type> getListProduct_type() {
		return sessionTemplate.selectList("getListProduct_type");
	}

}
