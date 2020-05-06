package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.Order_detail_product_midDao;
import com.tj.sp.dto.Order_detail_product_mid;
import com.tj.sp.util.Paging;
@Service
public class Order_detail_product_midServiceImpl implements Order_detail_product_midService {
	@Autowired
	private Order_detail_product_midDao order_detail_product_midDao;
	@Override
	public List<Order_detail_product_mid> listOrder_detailByCid(
			Order_detail_product_mid order_detail_product_mid, String pageNum) {
		String cid = order_detail_product_mid.getCid();
		Paging paging = new Paging(order_detail_product_midDao.cntOrder_detailByCid(cid), pageNum, 10, 10);
		order_detail_product_mid.setStartrow(paging.getStartrow());
		order_detail_product_mid.setEndrow(paging.getEndrow());
		return order_detail_product_midDao.listOrder_detailByCid(order_detail_product_mid);
	}
	@Override
	public List<Order_detail_product_mid> listOrder_detailByMid(
			Order_detail_product_mid order_detail_product_mid, String pageNum) {
		String mid = order_detail_product_mid.getMid();
		Paging paging = new Paging(order_detail_product_midDao.cntOrder_detailByMid(mid), pageNum, 10, 10);
		order_detail_product_mid.setStartrow(paging.getStartrow());
		order_detail_product_mid.setEndrow(paging.getEndrow());
		return order_detail_product_midDao.listOrder_detailByMid(order_detail_product_mid);
	}
	@Override
	public int cntOrder_detailByCid(String cid) {
		return order_detail_product_midDao.cntOrder_detailByCid(cid);
	}
}
