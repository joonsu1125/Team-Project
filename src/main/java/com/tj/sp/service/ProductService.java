package com.tj.sp.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.sp.dto.Product;
import com.tj.sp.dto.Product_Product_option;

public interface ProductService {
	public List<Product_Product_option> product_Product_optionList(String pagenum, Product_Product_option ppo);
	public int cntProduct_Product_optionList(Product_Product_option ppo);
	public List<Product> getProductList(Product product);
	public List<Product> marketList(Product product);
	public Product getProduct(String pcode);
	public int registerProduct(MultipartHttpServletRequest mRequest, Product_Product_option ppo);
	public int modifyProduct(MultipartHttpServletRequest mRequest);
	public int deleteProduct(Product product);
	public int cntProduct();
	public int totalproduct();
	public Product detailProduct(String pcode);
	public List<Product_Product_option> marketMain(Product product, String pagenum, String schword);
	public int cntMarketMain(Product product);
}
