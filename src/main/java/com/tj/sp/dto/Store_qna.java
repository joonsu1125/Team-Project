package com.tj.sp.dto;

import java.sql.Date;

public class Store_qna {
	private String sqcode    ;
	private String sqtitle	 ;
	private String sqcontent ;
	private Date   sqrdate	 ;
	private int    sqgroup	 ;
	private int    sqstep	 ;
	private int    sqindent	 ;
	private int    sqhit	 ;
	private String mid	     ;
	private String cid	     ;
	private String mname     ;
	private String cname     ;
	private int    startrow	 ;
	private int    endrow	 ;
	private String schitem	 ;
	private String schword	 ;
	public Store_qna() {}
	public String getSqcode() {
		return sqcode;
	}
	public void setSqcode(String sqcode) {
		this.sqcode = sqcode;
	}
	public String getSqtitle() {
		return sqtitle;
	}
	public void setSqtitle(String sqtitle) {
		this.sqtitle = sqtitle;
	}
	public String getSqcontent() {
		return sqcontent;
	}
	public void setSqcontent(String sqcontent) {
		this.sqcontent = sqcontent;
	}
	public Date getSqrdate() {
		return sqrdate;
	}
	public void setSqrdate(Date sqrdate) {
		this.sqrdate = sqrdate;
	}
	public int getSqgroup() {
		return sqgroup;
	}
	public void setSqgroup(int sqgroup) {
		this.sqgroup = sqgroup;
	}
	public int getSqstep() {
		return sqstep;
	}
	public void setSqstep(int sqstep) {
		this.sqstep = sqstep;
	}
	public int getSqindent() {
		return sqindent;
	}
	public void setSqindent(int sqindent) {
		this.sqindent = sqindent;
	}
	public int getSqhit() {
		return sqhit;
	}
	public void setSqhit(int sqhit) {
		this.sqhit = sqhit;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		return "Store_qna [sqcode=" + sqcode + ", sqtitle=" + sqtitle + ", sqcontent=" + sqcontent + ", sqrdate="
				+ sqrdate + ", sqgroup=" + sqgroup + ", sqstep=" + sqstep + ", sqindent=" + sqindent + ", sqhit="
				+ sqhit + ", mid=" + mid + ", cid=" + cid + ", mname=" + mname + ", cname=" + cname + ", startrow="
				+ startrow + ", endrow=" + endrow + ", schitem=" + schitem + ", schword=" + schword + "]";
	}
}
