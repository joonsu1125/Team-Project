package com.tj.sp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.Order_detailDao;
import com.tj.sp.dto.Order_detail;
import com.tj.sp.dto.Sp_order;
@Service
public class Order_detailServiceImpl implements Order_detailService {
	@Autowired
	private Order_detailDao order_detailDao;
	@Override
	public int insertOrder_detail(String[] pocode, String[] cuid, String[] odcount, String[] odunit) {
		Order_detail order_detail = new Order_detail();
		int result = 0;
		for(int i=0 ; i<pocode.length ; i++) {
			order_detail.setPocode	(pocode[i]	);
			order_detail.setCuid	(cuid[i]	);
			order_detail.setOdcount	(odcount[i]	);
			order_detail.setOdunit	(odunit[i]	);
			result=order_detailDao.insertOrder_detail(order_detail);
		}
		return result;
	}

}
