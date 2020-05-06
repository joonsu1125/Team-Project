package com.tj.sp.dao;

import java.util.ArrayList;
import java.util.List;

import com.tj.sp.dto.Cart;
import com.tj.sp.dto.Cart_Product_option;

public interface CartDao {
	public List<Cart_Product_option> listCartByCid(String cid);
	public int insertCart(Cart cart);
	public int deleteCart(String cartno);
	public int updateCart(Cart cart);
	public int buyCart(String[] cartno);
	public List<Cart> getArrayCartno(int num);
	public int numberCart(String cid);
	
	public List<Cart_Product_option> listCartByCartno(List<String> cartnos);
	public Cart_Product_option CartPrice(String cartno);
}
