package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Market;
@Repository
public class MarketDaoImpl implements MarketDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public Market getMarket(String mid) {
		// 로그인시 해당 마켓회원 가져오기
		return sessionTemplate.selectOne("getMarket",mid);
	}

	@Override
	public List<Market> totalMarket() {
		// 전체 마켓 목록 가져오기
		return sessionTemplate.selectList("totalMarket");
	}

	@Override
	public int midConfirm(String mid) {
		// 마켓가입시 아이디 중복 검색
		return sessionTemplate.selectOne("midConfirm",mid);
	}

	@Override
	public int registMarket(Market market) {
		// 마켓회원 가입하기
		return sessionTemplate.insert("registMarket", market);
	}

	@Override
	public int modifyMarket(Market market) {
		// 마켓 회원정보 수정
		return sessionTemplate.update("modifyMarket", market);
	}

	@Override
	public int deleteMarket(String mid) {
		// 마켓회원 탈퇴
		return sessionTemplate.delete("deleteMarket", mid);
	}

}
