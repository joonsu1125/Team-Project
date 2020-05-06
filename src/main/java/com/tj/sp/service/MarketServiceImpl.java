package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.MarketDao;
import com.tj.sp.dto.Market;
@Service
public class MarketServiceImpl implements MarketService {
	@Autowired
	private MarketDao marketDao;
	
	@Override
	public Market getMarket(String mid) {
		return marketDao.getMarket(mid);
	}

	@Override
	public List<Market> totalMarket() {
		return marketDao.totalMarket();
	}

	@Override
	public int midConfirm(String mid) {
		return marketDao.midConfirm(mid);
	}

	@Override
	public int registMarket(Market market) {
		return marketDao.registMarket(market);
	}

	@Override
	public int modifyMarket(Market market) {
		return marketDao.modifyMarket(market);
	}

	@Override
	public int deleteMarket(String mid) {
		return marketDao.deleteMarket(mid);
	}

}
