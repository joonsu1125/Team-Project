package com.tj.sp.dto;

public class Product_option {
	private String pocode   ;
	private String poname   ;
	private int    ponet    ;
	private int    poprice	;
	private String typecode ;
	private String pcode    ;
	private int    postock  ;
	public Product_option() {}
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
	public int getPostock() {
		return postock;
	}
	public void setPostock(int postock) {
		this.postock = postock;
	}
	@Override
	public String toString() {
		return "Product_option [pocode=" + pocode + ", poname=" + poname + ", ponet=" + ponet + ", poprice=" + poprice
				+ ", typecode=" + typecode + ", pcode=" + pcode + ", postock=" + postock + "]";
	}

}
