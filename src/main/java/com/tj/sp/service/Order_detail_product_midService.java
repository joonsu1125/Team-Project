package com.tj.sp.service;

import java.util.List;

import com.tj.sp.dto.Order_detail_product_mid;

public interface Order_detail_product_midService {
	public List<Order_detail_product_mid> listOrder_detailByCid(
			Order_detail_product_mid order_detail_product_mid, String pageNum);
	public List<Order_detail_product_mid> listOrder_detailByMid(
			Order_detail_product_mid order_detail_product_mid, String pageNum);
	public int cntOrder_detailByCid(String cid);
}
