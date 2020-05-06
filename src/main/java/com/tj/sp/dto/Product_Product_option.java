package com.tj.sp.dto;

public class Product_Product_option {
	private String pcode    ;
	private String ptitle	;
	private String pcontent ;
	private String pimage1	;
	private String pimage2	;
	private String pimage3	;
	private String mid      ;
	private String mname;	
	private String schword	;
	private String pocode   ;
	private String poname   ;
	private int    ponet    ;
	private int    poprice	;
	private String typecode ;
	private int    postock  ;
	private int    startrow	;
	private int    endrow	;
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
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getSchword() {
		return schword;
	}
	public void setSchword(String schword) {
		this.schword = schword;
	}
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
	public int getPostock() {
		return postock;
	}
	public void setPostock(int postock) {
		this.postock = postock;
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
	@Override
	public String toString() {
		return "Product_Product_option [pcode=" + pcode + ", ptitle=" + ptitle + ", pcontent=" + pcontent + ", pimage1="
				+ pimage1 + ", pimage2=" + pimage2 + ", pimage3=" + pimage3 + ", mid=" + mid + ", mname=" + mname
				+ ", schword=" + schword + ", pocode=" + pocode + ", poname=" + poname + ", ponet=" + ponet
				+ ", poprice=" + poprice + ", typecode=" + typecode + ", postock=" + postock + ", startrow=" + startrow
				+ ", endrow=" + endrow + "]";
	}
	
}
