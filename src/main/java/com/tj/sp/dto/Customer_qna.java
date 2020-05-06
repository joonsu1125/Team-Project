package com.tj.sp.dto;

import java.sql.Date;

public class Customer_qna {
	private String cqcode	;
	private String cqtitle	;
	private String cqcontent;
	private Date   cqrdate	;
	private int    cqgroup	;
	private int    cqstep	;
	private int    cqindent	;
	private int    cqhit	;
	private String cid		;
	private String aid		;
	private String cname	;
	private int    startrow	;
	private int    endrow	;
	private String schitem	;
	private String schword	;
	public Customer_qna() {}
	public String getCqcode() {
		return cqcode;
	}
	public void setCqcode(String cqcode) {
		this.cqcode = cqcode;
	}
	public String getCqtitle() {
		return cqtitle;
	}
	public void setCqtitle(String cqtitle) {
		this.cqtitle = cqtitle;
	}
	public String getCqcontent() {
		return cqcontent;
	}
	public void setCqcontent(String cqcontent) {
		this.cqcontent = cqcontent;
	}
	public Date getCqrdate() {
		return cqrdate;
	}
	public void setCqrdate(Date cqrdate) {
		this.cqrdate = cqrdate;
	}
	public int getCqgroup() {
		return cqgroup;
	}
	public void setCqgroup(int cqgroup) {
		this.cqgroup = cqgroup;
	}
	public int getCqstep() {
		return cqstep;
	}
	public void setCqstep(int cqstep) {
		this.cqstep = cqstep;
	}
	public int getCqindent() {
		return cqindent;
	}
	public void setCqindent(int cqindent) {
		this.cqindent = cqindent;
	}
	public int getCqhit() {
		return cqhit;
	}
	public void setCqhit(int cqhit) {
		this.cqhit = cqhit;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
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
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "Customer_qna [cqcode=" + cqcode + ", cqtitle=" + cqtitle + ", cqcontent=" + cqcontent + ", cqrdate="
				+ cqrdate + ", cqgroup=" + cqgroup + ", cqstep=" + cqstep + ", cqindent=" + cqindent + ", cqhit="
				+ cqhit + ", cid=" + cid + ", aid=" + aid + ", cname=" + cname + ", startrow=" + startrow + ", endrow="
				+ endrow + ", schitem=" + schitem + ", schword=" + schword + "]";
	}
		
}
