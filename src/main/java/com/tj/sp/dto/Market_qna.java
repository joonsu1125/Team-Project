package com.tj.sp.dto;

import java.sql.Date;

public class Market_qna {
	private String mqcode    ;         
	private String mqtitle	 ;         
	private String mqcontent ;         
	private Date   mqrdate	 ;         
	private int    mqgroup	 ;         
	private int    mqstep	 ;         
	private int    mqindent	 ;         
	private int    mqhit	 ;         
	private String mid       ;         
	private String aid       ;
	private String mname     ;
	private int    startrow	 ;
	private int    endrow	 ;
	private String schitem	 ;
	private String schword	 ;
	public Market_qna() {}
	public String getMqcode() {
		return mqcode;
	}
	public void setMqcode(String mqcode) {
		this.mqcode = mqcode;
	}
	public String getMqtitle() {
		return mqtitle;
	}
	public void setMqtitle(String mqtitle) {
		this.mqtitle = mqtitle;
	}
	public String getMqcontent() {
		return mqcontent;
	}
	public void setMqcontent(String mqcontent) {
		this.mqcontent = mqcontent;
	}
	public Date getMqrdate() {
		return mqrdate;
	}
	public void setMqrdate(Date mqrdate) {
		this.mqrdate = mqrdate;
	}
	public int getMqgroup() {
		return mqgroup;
	}
	public void setMqgroup(int mqgroup) {
		this.mqgroup = mqgroup;
	}
	public int getMqstep() {
		return mqstep;
	}
	public void setMqstep(int mqstep) {
		this.mqstep = mqstep;
	}
	public int getMqindent() {
		return mqindent;
	}
	public void setMqindent(int mqindent) {
		this.mqindent = mqindent;
	}
	public int getMqhit() {
		return mqhit;
	}
	public void setMqhit(int mqhit) {
		this.mqhit = mqhit;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	@Override
	public String toString() {
		return "Market_qna [mqcode=" + mqcode + ", mqtitle=" + mqtitle + ", mqcontent=" + mqcontent + ", mqrdate="
				+ mqrdate + ", mqgroup=" + mqgroup + ", mqstep=" + mqstep + ", mqindent=" + mqindent + ", mqhit="
				+ mqhit + ", mid=" + mid + ", aid=" + aid + ", mname=" + mname + ", startrow=" + startrow + ", endrow="
				+ endrow + ", schitem=" + schitem + ", schword=" + schword + ", getMqcode()=" + getMqcode()
				+ ", getMqtitle()=" + getMqtitle() + ", getMqcontent()=" + getMqcontent() + ", getMqrdate()="
				+ getMqrdate() + ", getMqgroup()=" + getMqgroup() + ", getMqstep()=" + getMqstep() + ", getMqindent()="
				+ getMqindent() + ", getMqhit()=" + getMqhit() + ", getMid()=" + getMid() + ", getAid()=" + getAid()
				+ ", getStartrow()=" + getStartrow() + ", getEndrow()=" + getEndrow() + ", getSchitem()=" + getSchitem()
				+ ", getSchword()=" + getSchword() + ", getMname()=" + getMname() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
