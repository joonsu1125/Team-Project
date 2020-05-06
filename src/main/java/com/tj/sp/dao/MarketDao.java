package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Market;

public interface MarketDao {	
	public Market getMarket(String mid);
	public List<Market> totalMarket();
	public int midConfirm(String mid);
	public int registMarket(Market market);
	public int modifyMarket(Market market);
	public int deleteMarket(String mid);
	
}
