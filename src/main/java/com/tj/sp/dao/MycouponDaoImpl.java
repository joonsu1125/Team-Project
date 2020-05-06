package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Mycoupon;
@Repository
public class MycouponDaoImpl implements MycouponDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<Mycoupon> listMycoupon(String cid) {
		return sessionTemplate.selectList("listMycoupon", cid);
	}

	@Override
	public Mycoupon getMycoupon(String chnum) {
		return sessionTemplate.selectOne("getMycoupon", chnum);
	}

	@Override
	public int useMycoupon(String[] chnum) {
		return sessionTemplate.delete("useMycoupon", chnum);
	}

	@Override
	public int givecoupon(Mycoupon mycoupon) {
		return sessionTemplate.insert("givecoupon", mycoupon);
	}

	@Override
	public int countCoupon(String cid) {
		return sessionTemplate.selectOne("countCoupon", cid);
	}
	
}
