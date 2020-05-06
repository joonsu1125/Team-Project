package com.tj.sp.service;

import java.util.List;

import com.tj.sp.dto.Mycoupon;

public interface MycouponService {
	public List<Mycoupon> listMycoupon(String cid);
	public Mycoupon getMycoupon(String chnum);
	public int useMycoupon(String[] chnum);
	public int givecoupon(Mycoupon mycoupon, String gcode);
	public int countCoupon(String cid);
}
