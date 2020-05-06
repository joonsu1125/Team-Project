package com.tj.sp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Order_detail_product_mid;
@Repository
public class Order_detail_product_midDaoImpl implements Order_detail_product_midDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int cntOrder_detailByCid(String cid) {
		return sessionTemplate.selectOne("cntOrder_detailByCid", cid);
	}
	@Override
	public List<Order_detail_product_mid> listOrder_detailByCid(Order_detail_product_mid order_detail_product_mid) {
		return sessionTemplate.selectList("listOrder_detailByCid", order_detail_product_mid);
	}
	@Override
	public int cntOrder_detailByMid(String mid) {
		return sessionTemplate.selectOne("cntOrder_detailByMid", mid);
	}
	@Override
	public List<Order_detail_product_mid> listOrder_detailByMid(Order_detail_product_mid order_detail_product_mid) {
		return sessionTemplate.selectList("listOrder_detailByMid", order_detail_product_mid);
	}
}
