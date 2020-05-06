package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.Product_typeDao;
import com.tj.sp.dto.Product_type;
@Service
public class Product_typeServiceImpl implements Product_typeService {
	@Autowired
	private Product_typeDao  product_typeDao;
	@Override
	public List<Product_type> getListProduct_type() {
		return product_typeDao.getListProduct_type();
	}

}
