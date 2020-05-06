package com.tj.sp.dto;

public class Product_qna {
	private String pqcode	  	;	
	private String pqtitle	  	;
	private String pqcontent	;
	private String pqanswer	  	;
	private String pqsecret	  	;
	private String pqcomplete	;
	private String pqdate	  	;
	private String pcode      	;
	private String cid        	;
	private int    startrow		;
	private int    endrow		;
	private String schitem		;
	private String schword		;
	public Product_qna() {}
	public String getPqcode() {
		return pqcode;
	}
	public void setPqcode(String pqcode) {
		this.pqcode = pqcode;
	}
	public String getPqtitle() {
		return pqtitle;
	}
	public void setPqtitle(String pqtitle) {
		this.pqtitle = pqtitle;
	}
	public String getPqcontent() {
		return pqcontent;
	}
	public void setPqcontent(String pqcontent) {
		this.pqcontent = pqcontent;
	}
	public String getPqanswer() {
		return pqanswer;
	}
	public void setPqanswer(String pqanswer) {
		this.pqanswer = pqanswer;
	}
	public String getPqsecret() {
		return pqsecret;
	}
	public void setPqsecret(String pqsecret) {
		this.pqsecret = pqsecret;
	}
	public String getPqcomplete() {
		return pqcomplete;
	}
	public void setPqcomplete(String pqcomplete) {
		this.pqcomplete = pqcomplete;
	}
	public String getPqdate() {
		return pqdate;
	}
	public void setPqdate(String pqdate) {
		this.pqdate = pqdate;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getSchitem() {
		return schitem;
	}
	public void setSchitem(String schitem) {
		this.schitem = schitem;
	}
	public String getSchword() {
		return schword;
	}
	public void setSchword(String schword) {
		this.schword = schword;
	}
	@Override
	public String toString() {
		return "Product_qna [pqcode=" + pqcode + ", pqtitle=" + pqtitle + ", pqcontent=" + pqcontent + ", pqanswer="
				+ pqanswer + ", pqsecret=" + pqsecret + ", pqcomplete=" + pqcomplete + ", pqdate=" + pqdate + ", pcode="
				+ pcode + ", cid=" + cid + ", startrow=" + startrow + ", endrow=" + endrow + ", schitem=" + schitem
				+ ", schword=" + schword + "]";
	}
	

}
