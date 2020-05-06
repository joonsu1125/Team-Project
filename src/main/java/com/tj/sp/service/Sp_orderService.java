package com.tj.sp.service;

import com.tj.sp.dto.Sp_order;

public interface Sp_orderService {
	public int insertSp_order(Sp_order sp_order);
	public int updateSp_order(String ocode);
}
