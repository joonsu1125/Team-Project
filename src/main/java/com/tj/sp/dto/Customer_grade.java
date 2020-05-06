package com.tj.sp.dto;

import java.sql.Date;

public class Customer_grade {
	private String gcode	;
	private String grade	;
	private int    ghigh	;
	private int    glow		;
	private int    gpoint	;
	
	private String cid      ;
	private String cpw      ;
	private String cname	;
	private String addrcode	;
	private String cemail	;
	private String ctel	    ;
	private Date   crdate	;
	private Date   cbirth	;
	private int    cpoint	;
	private String csnsid	;
	private String cprovider;
	private int    startrow	;
	private int    endrow	;
	private String schitem	;
	private String schword	;
	public Customer_grade() {}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getGhigh() {
		return ghigh;
	}
	public void setGhigh(int ghigh) {
		this.ghigh = ghigh;
	}
	public int getGlow() {
		return glow;
	}
	public void setGlow(int glow) {
		this.glow = glow;
	}
	public int getGpoint() {
		return gpoint;
	}
	public void setGpoint(int gpoint) {
		this.gpoint = gpoint;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getAddrcode() {
		return addrcode;
	}
	public void setAddrcode(String addrcode) {
		this.addrcode = addrcode;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public Date getCrdate() {
		return crdate;
	}
	public void setCrdate(Date crdate) {
		this.crdate = crdate;
	}
	public Date getCbirth() {
		return cbirth;
	}
	public void setCbirth(Date cbirth) {
		this.cbirth = cbirth;
	}
	public int getCpoint() {
		return cpoint;
	}
	public void setCpoint(int cpoint) {
		this.cpoint = cpoint;
	}
	public String getCsnsid() {
		return csnsid;
	}
	public void setCsnsid(String csnsid) {
		this.csnsid = csnsid;
	}
	public String getCprovider() {
		return cprovider;
	}
	public void setCprovider(String cprovider) {
		this.cprovider = cprovider;
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
		return "Customer_grade [gcode=" + gcode + ", grade=" + grade + ", ghigh=" + ghigh + ", glow=" + glow
				+ ", gpoint=" + gpoint + ", cid=" + cid + ", cpw=" + cpw + ", cname=" + cname + ", addrcode=" + addrcode
				+ ", cemail=" + cemail + ", ctel=" + ctel + ", crdate=" + crdate + ", cbirth=" + cbirth + ", cpoint="
				+ cpoint + ", csnsid=" + csnsid + ", cprovider=" + cprovider + ", startrow=" + startrow + ", endrow="
				+ endrow + ", schitem=" + schitem + ", schword=" + schword + "]";
	}
	
	
}
