package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.sp.dao.Product_optionDao;
import com.tj.sp.dto.Product_option;
@Service
public class Product_optionServiceImpl implements Product_optionService {
	@Autowired
	private Product_optionDao product_optionDao;
	@Override
	public List<Product_option> listForCart(String pcode) {
		return product_optionDao.listForCart(pcode);
	}
	@Override
	public List<Product_option> product_optionList(Product_option product_option) {
		return product_optionDao.product_optionList(product_option);
	}

	@Override
	public int registerProduct_option(MultipartHttpServletRequest mRequest) {
		String[] poname = mRequest.getParameterValues("poname");
		String[] ponet = mRequest.getParameterValues("ponet");
		String[] postock = mRequest.getParameterValues("postock");
		String[] poprice = mRequest.getParameterValues("poprice");
		String[] typecode = mRequest.getParameterValues("typecode");
		Product_option product_option = new Product_option();
		int result=0;
		for(int i=0; i<poname.length ; i++) {
			product_option.setPoname(poname[i]);
			product_option.setPonet(Integer.parseInt(ponet[i]));
			product_option.setPostock(Integer.parseInt(postock[i]));
			product_option.setPoprice(Integer.parseInt(poprice[i]));
			product_option.setTypecode(typecode[i]);
			result += product_optionDao.registerProduct_option(product_option);
		}
		return result;
	}

	@Override
	public Product_option getProduct_option(String pocode) {
		return product_optionDao.getProduct_option(pocode);
	}
	

}
