package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.CouponDao;
import com.tj.sp.dto.Coupon;
@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDao couponDao;
	@Override
	public int insertCoupon(Coupon coupon) {
		return couponDao.insertCoupon(coupon);
	}
	@Override
	public List<Coupon> getListCoupon() {
		return couponDao.getListCoupon();
	}
}
