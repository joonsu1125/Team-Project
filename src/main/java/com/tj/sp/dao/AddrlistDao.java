package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Addrlist;

public interface AddrlistDao {
	public List<Addrlist> listAddrlist(String cid);
	public int registAddrlist(Addrlist addrlist);
	public int modifyAddrlist(Addrlist addrlist);
	public int deleteAddrlist(String addrcode);
	public String getFirstAddrCode();
	public int cntAddrlist(String cid);
	public Addrlist getAddrcode(String addrcode);
}
