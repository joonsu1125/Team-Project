package com.tj.sp.dao;

import com.tj.sp.dto.Sp_order;

public interface Sp_orderDao {
	public int insertSp_order(Sp_order sp_order);
	public int updateSp_order(String ocode);
}
