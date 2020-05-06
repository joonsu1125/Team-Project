package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Market_qna;
import com.tj.sp.dto.Store_qna;
@Repository
public class MarketQnaDaoImpl implements MarketQnaDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<Market_qna> marketQnaList(Market_qna qna) {
		// 글 목록 가져오기
		return sessionTemplate.selectList("marketQnaList", qna);
	}

	@Override
	public int totalMarketQna() {
		// 전체 글 갯수 가져오기
		return sessionTemplate.selectOne("totalMarketQna");
	}

	@Override
	public Market_qna getMarketQnaDetail(String mqcode) {
		// 상세글 보기
		return sessionTemplate.selectOne("getMarketQnaDetail", mqcode);
	}

	@Override
	public int writeMarketQna(Market_qna qna) {
		// 원글 쓰기
		return sessionTemplate.insert("writeMarketQna", qna);
	}

	@Override
	public int modifyMarketQna(Market_qna qna) {
		// 글 수정하기
		return sessionTemplate.update("modifyMarketQna", qna);
	}

	@Override
	public int hitupMarketQna(String mqcode) {
		// 조회수 올리기
		return sessionTemplate.update("hitupMarketQna", mqcode);
	}

	@Override
	public int replyStepAMarketQna(Market_qna qna) {
		// 답변글 달기전 stepA
		return sessionTemplate.update("replyStepAMarketQna", qna);
	}

	@Override
	public int replyMarketQna(Market_qna qna) {
		// 답변글 달기
		return sessionTemplate.insert("replyMarketQna", qna);
	}

	@Override
	public int deletMarketQna(String mqcode) {
		// 글 삭제하기
		return sessionTemplate.delete("deletMarketQna", mqcode);
	}

}
