package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Coupon;

@Repository
public class CouponDaoImpl implements CouponDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int insertCoupon(Coupon coupon) {
		return sessionTemplate.insert("insertCoupon",coupon);
	}
	@Override
	public List<Coupon> getListCoupon() {
		return sessionTemplate.selectList("getListCoupon");
	}
	

}
