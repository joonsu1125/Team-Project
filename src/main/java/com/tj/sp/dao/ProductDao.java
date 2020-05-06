package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Product;
import com.tj.sp.dto.Product_Product_option;

public interface ProductDao {
	public List<Product_Product_option> product_Product_optionList(Product_Product_option ppo);
	public int cntProduct_Product_optionList(Product_Product_option ppo);
	public List<Product> marketList(Product product);
	public Product getProduct(String pcode);
	public int registerProduct(Product_Product_option ppo);
	public int modifyProduct(Product product);
	public int deleteProduct(Product product);
	public int cntProduct();
	public List<Product> getProductList(Product product);
	public int totalproduct();
	public Product detailProduct(String pcode);
	public List<Product_Product_option> marketMain(Product product, String schword);
	public int cntMarketMain(Product product);
}
