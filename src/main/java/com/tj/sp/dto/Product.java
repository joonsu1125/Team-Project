package com.tj.sp.dto;

public class Product {
	private String pcode    ;
	private String ptitle	;
	private String pcontent ;
	private String pimage1	;
	private String pimage2	;
	private String pimage3	;
	private String mid      ;
	private int    startrow	;
	private int    endrow	;
	private String mname	;	
	private String schword	;
	
	public Product() {}
	
	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPimage1() {
		return pimage1;
	}

	public void setPimage1(String pimage1) {
		this.pimage1 = pimage1;
	}

	public String getPimage2() {
		return pimage2;
	}

	public void setPimage2(String pimage2) {
		this.pimage2 = pimage2;
	}

	public String getPimage3() {
		return pimage3;
	}

	public void setPimage3(String pimage3) {
		this.pimage3 = pimage3;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
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

	public String getSchword() {
		return schword;
	}

	public void setSchword(String schword) {
		this.schword = schword;
	}

	@Override
	public String toString() {
		return "Product [pcode=" + pcode + ", ptitle=" + ptitle + ", pcontent=" + pcontent + ", pimage1=" + pimage1
				+ ", pimage2=" + pimage2 + ", pimage3=" + pimage3 + ", mid=" + mid + ", mname=" + mname + ", startrow="
				+ startrow + ", endrow=" + endrow + ", schword=" + schword + "]";
	}

}
