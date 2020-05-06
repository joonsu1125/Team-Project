package com.tj.sp.dao;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Product;
import com.tj.sp.dto.Product_Product_option;
@Repository
public class ProductDaoimpl implements ProductDao{
	@Autowired
	private SqlSession sessionTemplate;
	@Autowired
	private DataSource ds;
	@Override
	public List<Product> getProductList(Product product) {
		return sessionTemplate.selectList("getProductList",product);
	}
	@Override
	public int totalproduct() {
		return sessionTemplate.selectOne("totalproduct");
	}
	@Override
	public Product detailProduct(String pcode) {
		return sessionTemplate.selectOne("detailProduct",pcode);
	}
	@Override
	public List<Product_Product_option> product_Product_optionList(Product_Product_option ppo){
		return sessionTemplate.selectList("product_Product_optionList", ppo);
	}
	@Override
	public List<Product> marketList(Product product) {
		return sessionTemplate.selectList("marketList", product);
	}
	@Override
	public Product getProduct(String pcode) {
		return sessionTemplate.selectOne("getProduct", pcode);
	}
	@Override
	public int registerProduct(Product_Product_option ppo) {
		System.out.println("DAO에서 mapper 호출 바로 전 ppo : "+ppo);
		return sessionTemplate.insert("registerProduct", ppo);
	}
	@Override
	public int modifyProduct(Product product) {
		return sessionTemplate.update("modifyProduct", product);
	}
	@Override
	public int deleteProduct(Product product) {
		return sessionTemplate.delete("deleteProduct", product);
	}
	@Override
	public int cntProduct() {
		return sessionTemplate.selectOne("cntProduct");
	}
	@Override
	public List<Product_Product_option> marketMain(Product product, String schword) {
		return sessionTemplate.selectList("marketMain", product);
	}
	@Override
	public int cntMarketMain(Product product) {
		return sessionTemplate.selectOne("cntMarketMain", product);
	}
	@Override
	public int cntProduct_Product_optionList(Product_Product_option ppo) {
		return sessionTemplate.selectOne("cntProduct_Product_optionList", ppo);
	}
}
