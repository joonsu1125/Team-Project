package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Coupon;

public interface CouponDao {
	public int insertCoupon(Coupon coupon);
	public List<Coupon> getListCoupon();
	
}
