package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.CustomerDao;
import com.tj.sp.dao.MycouponDao;
import com.tj.sp.dto.Customer;
import com.tj.sp.dto.Mycoupon;
@Service
public class MycouponServiceImpl implements MycouponService {
	@Autowired
	private MycouponDao mycoupondao;
	@Autowired
	private CustomerDao customerdao;
	@Override
	public List<Mycoupon> listMycoupon(String cid) {
		return mycoupondao.listMycoupon(cid);
	}

	@Override
	public Mycoupon getMycoupon(String chnum) {
		return mycoupondao.getMycoupon(chnum);
	}

	@Override
	public int useMycoupon(String[] chnum) {
		if(chnum.length == 0) {
			return 0;
		}
		return mycoupondao.useMycoupon(chnum);
	}

	@Override
	public int givecoupon(Mycoupon mycoupon, String gcode) {
		List<Customer> customer = customerdao.getListCidByGrade(gcode);
		int result = 0;
		for(Customer c: customer) {
			mycoupon.setCid(c.getCid());
			mycoupondao.givecoupon(mycoupon);
			result++;
		}
		return result;
	}

	@Override
	public int countCoupon(String cid) {
		return mycoupondao.countCoupon(cid);
	}

}
