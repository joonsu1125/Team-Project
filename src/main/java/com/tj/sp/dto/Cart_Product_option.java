package com.tj.sp.dto;

public class Cart_Product_option {
	private String pocode   ;
	private String poname   ;
	private int    ponet    ;
	private int    poprice	;
	private String typecode ;
	private String pcode    ;
	private String cartno    ;
	private String cid       ;
	private int    cartcount ;
	private String pimage    ;
	public Cart_Product_option() {}
	public String getPocode() {
		return pocode;
	}
	public void setPocode(String pocode) {
		this.pocode = pocode;
	}
	public String getPoname() {
		return poname;
	}
	public void setPoname(String poname) {
		this.poname = poname;
	}
	public int getPonet() {
		return ponet;
	}
	public void setPonet(int ponet) {
		this.ponet = ponet;
	}
	public int getPoprice() {
		return poprice;
	}
	public void setPoprice(int poprice) {
		this.poprice = poprice;
	}
	public String getTypecode() {
		return typecode;
	}
	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
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
	public int getCartcount() {
		return cartcount;
	}
	public void setCartcount(int cartcount) {
		this.cartcount = cartcount;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	@Override
	public String toString() {
		return "Cart_Product_option [pocode=" + pocode + ", poname=" + poname + ", ponet=" + ponet + ", poprice="
				+ poprice + ", typecode=" + typecode + ", pcode=" + pcode + ", cartno=" + cartno + ", cid=" + cid
				+ ", cartcount=" + cartcount + ", pimage=" + pimage + "]";
	}
	
}

