package com.tj.sp.dto;

public class Coupon {
	private String 	cuid    ;
	private String 	cuname	;
	private int 	cusale	;
	public Coupon() {}
	public String getCuid() {
		return cuid;
	}
	public void setCuid(String cuid) {
		this.cuid = cuid;
	}
	public String getCuname() {
		return cuname;
	}
	public void setCuname(String cuname) {
		this.cuname = cuname;
	}
	public int getCusale() {
		return cusale;
	}
	public void setCusale(int cusale) {
		this.cusale = cusale;
	}
	@Override
	public String toString() {
		return "Coupon [cuid=" + cuid + ", cuname=" + cuname + ", cusale=" + cusale + "]";
	}
	
}
