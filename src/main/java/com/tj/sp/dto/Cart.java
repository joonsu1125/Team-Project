package com.tj.sp.dto;

public class Cart {
	private String cartno    ;
	private String cid       ;
	private String pocode    ;
	private int    cartcount ;
	public Cart() {}
	public String getCartno() {
		return cartno;
	}
	public void setCartno(String cartno) {
		this.cartno = cartno;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPocode() {
		return pocode;
	}
	public void setPocode(String pocode) {
		this.pocode = pocode;
	}
	public int getCartcount() {
		return cartcount;
	}
	public void setCartcount(int cartcount) {
		this.cartcount = cartcount;
	}
	@Override
	public String toString() {
		return "Cart [cartno=" + cartno + ", cid=" + cid + ", pocode=" + pocode + ", cartcount=" + cartcount + "]";
	}
	
	

}
