package com.tj.sp.dto;

import java.sql.Date;

public class Review {
	private String rcode   ;
	private String rcontent;
	private int    rstar   ;
	private Date   rrdate  ;
	private String rimage  ;
	private String cid     ;
	private String pcode   ;
	private int    startrow;
	private int    endrow  ;
	private String schitem	;
	private String schword	;
	public Review() {}
	public String getRcode() {
		return rcode;
	}
	public void setRcode(String rcode) {
		this.rcode = rcode;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public int getRstar() {
		return rstar;
	}
	public void setRstar(int rstar) {
		this.rstar = rstar;
	}
	public Date getRrdate() {
		return rrdate;
	}
	public void setRrdate(Date rrdate) {
		this.rrdate = rrdate;
	}
	public String getRimage() {
		return rimage;
	}
	public void setRimage(String rimage) {
		this.rimage = rimage;
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
		return "Review [rcode=" + rcode + ", rcontent=" + rcontent + ", rstar=" + rstar + ", rrdate=" + rrdate
				+ ", rimage=" + rimage + ", cid=" + cid + ", pcode=" + pcode + ", startrow=" + startrow + ", endrow="
				+ endrow + ", schitem=" + schitem + ", schword=" + schword + "]";
	}
	

}
