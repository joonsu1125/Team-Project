package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Mycoupon;

public interface MycouponDao {
	public List<Mycoupon> listMycoupon(String cid);
	public Mycoupon getMycoupon(String chnum);
	public int useMycoupon(String[] chnum);
	public int givecoupon(Mycoupon mycoupon);
	public int countCoupon(String cid);
}	
