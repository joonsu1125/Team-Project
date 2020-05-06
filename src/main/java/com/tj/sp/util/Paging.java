package com.tj.sp.util;

public class Paging {
	private int currentpage =1;
	private int pagesize;
	private int blocksize;
	private int startrow;
	private int endrow;
	private int total;
	private int pagecnt;
	private int startpage;
	private int endpage;
	public Paging(int total,String pagenum, int pagesize, int blocksize) {
		if(pagenum!=null) {
			currentpage= Integer.parseInt(pagenum);
		}
		this.pagesize = pagesize;
		this.blocksize = blocksize;
		this.total = total;
		startrow = (currentpage-1)*pagesize +1;
		endrow = startrow + pagesize -1;
		pagecnt = (int) Math.ceil((double)total/pagesize);
		startpage = ((currentpage-1)/blocksize)*blocksize +1;
		endpage = startpage + blocksize -1;
		if(endpage>pagecnt) {
			endpage=pagecnt;
		}
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getBlocksize() {
		return blocksize;
	}
	public void setBlocksize(int blocksize) {
		this.blocksize = blocksize;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPagecnt() {
		return pagecnt;
	}
	public void setPagecnt(int pagecnt) {
		this.pagecnt = pagecnt;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	@Override
	public String toString() {
		return "Paging [currentpage=" + currentpage + ", pagesize=" + pagesize + ", blocksize=" + blocksize
				+ ", startrow=" + startrow + ", endrow=" + endrow + ", total=" + total + ", pagecnt=" + pagecnt
				+ ", startpage=" + startpage + ", endpage=" + endpage + "]";
	}
	
}
