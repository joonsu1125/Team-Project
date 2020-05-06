package com.tj.sp.dto;

public class Addrlist {
	private String addrcode ;
	private String addrname ;
	private String cpost    ;
	private String caddr1   ;
	private String caddr2   ;
	private String cid      ;
	public Addrlist() {}
	public String getAddrcode() {
		return addrcode;
	}
	public void setAddrcode(String addrcode) {
		this.addrcode = addrcode;
	}
	public String getAddrname() {
		return addrname;
	}
	public void setAddrname(String addrname) {
		this.addrname = addrname;
	}
	public String getCpost() {
		return cpost;
	}
	public void setCpost(String cpost) {
		this.cpost = cpost;
	}
	public String getCaddr1() {
		return caddr1;
	}
	public void setCaddr1(String caddr1) {
		this.caddr1 = caddr1;
	}
	public String getCaddr2() {
		return caddr2;
	}
	public void setCaddr2(String caddr2) {
		this.caddr2 = caddr2;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "Addrlist [addrcode=" + addrcode + ", addrname=" + addrname + ", cpost=" + cpost + ", caddr1=" + caddr1
				+ ", caddr2=" + caddr2 + ", cid=" + cid + "]";
	}
	
}
