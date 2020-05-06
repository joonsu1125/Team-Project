package com.tj.sp.dto;

public class Email_inquiry {
	private String eicode    ;
	private String cid       ;
	private String eitype	 ;
	private String eimaul	 ;
	private String eititle	 ;
	private String eicontent ;
	private String eifile	 ;
	public Email_inquiry() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getEicode() {
		return eicode;
	}
	public void setEicode(String eicode) {
		this.eicode = eicode;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getEitype() {
		return eitype;
	}
	public void setEitype(String eitype) {
		this.eitype = eitype;
	}
	public String getEimaul() {
		return eimaul;
	}
	public void setEimaul(String eimaul) {
		this.eimaul = eimaul;
	}
	public String getEititle() {
		return eititle;
	}
	public void setEititle(String eititle) {
		this.eititle = eititle;
	}
	public String getEicontent() {
		return eicontent;
	}
	public void setEicontent(String eicontent) {
		this.eicontent = eicontent;
	}
	public String getEifile() {
		return eifile;
	}
	public void setEifile(String eifile) {
		this.eifile = eifile;
	}
	@Override
	public String toString() {
		return "Email_inquiry [eicode=" + eicode + ", cid=" + cid + ", eitype=" + eitype + ", eimaul=" + eimaul
				+ ", eititle=" + eititle + ", eicontent=" + eicontent + ", eifile=" + eifile + "]";
	}
	

}
