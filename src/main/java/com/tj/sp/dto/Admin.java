package com.tj.sp.dto;

public class Admin {
	private String aid	;
	private String apw	;
	public Admin() {}
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApw() {
		return apw;
	}
	public void setApw(String apw) {
		this.apw = apw;
	}
	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", apw=" + apw + "]";
	}
	
}
