package com.tj.sp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Product_option;
@Repository
public class Product_optionDaoImpl implements Product_optionDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Product_option> listForCart(String pcode) {
		return sessionTemplate.selectList("listForCart", pcode);
	}
	@Override
	public List<Product_option> product_optionList(Product_option product_option) {
		return sessionTemplate.selectList("product_optionList", product_option);
	}
	@Override
	public int registerProduct_option(Product_option product_option) {
		return sessionTemplate.insert("registerProduct_option", product_option);
	}
	@Override
	public Product_option getProduct_option(String pocode) {
		return sessionTemplate.selectOne("getProduct_option", pocode);
	}
}
