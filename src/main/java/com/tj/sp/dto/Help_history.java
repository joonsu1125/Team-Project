package com.tj.sp.dto;

public class Help_history {
	private String hcode;
	private String rcode;
	private String cid  ;
	public Help_history() {}
	public String getHcode() {
		return hcode;
	}
	public void setHcode(String hcode) {
		this.hcode = hcode;
	}
	public String getRcode() {
		return rcode;
	}
	public void setRcode(String rcode) {
		this.rcode = rcode;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "Help_history [hcode=" + hcode + ", rcode=" + rcode + ", cid=" + cid + "]";
	}
	

}
