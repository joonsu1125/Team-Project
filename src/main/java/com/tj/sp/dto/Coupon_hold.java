package com.tj.sp.dto;

public class Coupon_hold {
	private String chnum ;
	private String cuid  ;
	private String cid   ;
	public Coupon_hold() {}
	public String getChnum() {
		return chnum;
	}
	public void setChnum(String chnum) {
		this.chnum = chnum;
	}
	public String getCuid() {
		return cuid;
	}
	public void setCuid(String cuid) {
		this.cuid = cuid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "Coupon_hold [chnum=" + chnum + ", cuid=" + cuid + ", cid=" + cid + "]";
	}
	
}
