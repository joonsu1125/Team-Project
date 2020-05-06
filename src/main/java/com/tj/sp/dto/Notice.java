package com.tj.sp.dto;

import java.sql.Date;

public class Notice {
	private String ncode   	;
	private String ntitle	;
	private String ncontent	;	
	private Date   nrdate	;
	private int    ngroup	;
	private int    nstep	;
	private int    nindent	;
	private int    nhit	   	;
	private String cid     	;
	private String aid     	;
	private int    startrow	;
	private int    endrow	;
	
	public Notice() {}
	public String getNcode() {
		return ncode;
	}
	public void setNcode(String ncode) {
		this.ncode = ncode;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Date getNrdate() {
		return nrdate;
	}
	public void setNrdate(Date nrdate) {
		this.nrdate = nrdate;
	}
	public int getNgroup() {
		return ngroup;
	}
	public void setNgroup(int ngroup) {
		this.ngroup = ngroup;
	}
	public int getNstep() {
		return nstep;
	}
	public void setNstep(int nstep) {
		this.nstep = nstep;
	}
	public int getNindent() {
		return nindent;
	}
	public void setNindent(int nindent) {
		this.nindent = nindent;
	}
	public int getNhit() {
		return nhit;
	}
	public void setNhit(int nhit) {
		this.nhit = nhit;
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
	
	@Override
	public String toString() {
		return "★ ★ ★ / ncode=" + ncode + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", nrdate=" + nrdate
				+ ", ngroup=" + ngroup + ", nstep=" + nstep + ", nindent=" + nindent + ", nhit=" + nhit + ", cid=" + cid
				+ ", aid=" + aid + ", startrow=" + startrow + ", endrow=" + endrow;
	}
	
}
