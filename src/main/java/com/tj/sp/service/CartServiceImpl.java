package com.tj.sp.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.CartDao;
import com.tj.sp.dto.Cart;
import com.tj.sp.dto.Cart_Product_option;
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao cartDao;
	@Override
	public List<Cart_Product_option> listCartByCid(String cid) {
		return cartDao.listCartByCid(cid);
	}
	@Override
	public int insertCart(String cid, String[] pocode, String[] cartcount){
		Cart cart = new Cart();
		int result = 0;
		while(result<pocode.length ) {
			cart.setCid(cid);
			cart.setPocode(pocode[result]);
			cart.setCartcount(Integer.parseInt(cartcount[result]));
			cartDao.insertCart(cart);
			result++;
		}
		return result;
	}

	@Override
	public int deleteCart(String cartno) {
		return cartDao.deleteCart(cartno);
	}

	@Override
	public int updateCart(Cart cart) {
		return cartDao.updateCart(cart);
	}
	@Override
	public List<Cart_Product_option> listCartByCartno(String[] cartno) {
		List<String> cartnos = new ArrayList<String>();
		for(int i=0 ; i<cartno.length ; i++) {
			cartnos.add(cartno[i]);
		}
		return cartDao.listCartByCartno(cartnos);
	}
	@Override
	public Cart_Product_option CartPrice(String cartno) {
		return cartDao.CartPrice(cartno);
	}
	@Override
	public int buyCart(String[] cartno) {
		return cartDao.buyCart(cartno);
	}
	@Override
	public String[] getArrayCartno(int num){
		List<Cart> cart = cartDao.getArrayCartno(num);
		String[] cartno = new String[cart.size()];
		for(int i=0; i<cart.size();i++){
			cartno[i] = cart.get(i).getCartno();
		}
		return cartno;
	}
	@Override
	public int numberCart(String cid) {
		return cartDao.numberCart(cid);
	}
	

}
