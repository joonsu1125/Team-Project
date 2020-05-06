package com.tj.sp.service;

import java.util.List;

import com.tj.sp.dto.Coupon;

public interface CouponService {
	public int insertCoupon(Coupon coupon);
	public List<Coupon> getListCoupon();
	
}
