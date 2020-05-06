package com.tj.sp.dto;

public class Favorite {
	private String fcode;
	private String cid  ;
	private String pcode;
	public Favorite() {}
	public String getFcode() {
		return fcode;
	}
	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	@Override
	public String toString() {
		return "Favorite [fcode=" + fcode + ", cid=" + cid + ", pcode=" + pcode + "]";
	}
	

}
