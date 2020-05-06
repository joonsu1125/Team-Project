package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.MarketQnaDao;
import com.tj.sp.dto.Market_qna;
@Service
public class MarketQnaServiceImpl implements MarketQnaService {
	
	@Autowired
	MarketQnaDao qDao;

	@Override
	public List<Market_qna> marketQnaList(Market_qna qna) {
		return qDao.marketQnaList(qna);
	}

	@Override
	public int totalMarketQna() {
		return qDao.totalMarketQna();
	}

	@Override
	public Market_qna getMarketQnaDetail(String mqcode) {
		return qDao.getMarketQnaDetail(mqcode);
	}

	@Override
	public int writeMarketQna(Market_qna qna) {
		return qDao.writeMarketQna(qna);
	}

	@Override
	public int modifyMarketQna(Market_qna qna) {
		return qDao.modifyMarketQna(qna);
	}

	@Override
	public int hitupMarketQna(String mqcode) {
		return qDao.hitupMarketQna(mqcode);
	}

	@Override
	public int replyStepAMarketQna(Market_qna qna) {
		return qDao.replyStepAMarketQna(qna);
	}

	@Override
	public int replyMarketQna(Market_qna qna) {
		// 들여쓰기 처리
		qna.setMqstep(qna.getMqstep()+1);
		qna.setMqindent(qna.getMqindent()+1);
		return qDao.replyMarketQna(qna);
	}

	@Override
	public int deletMarketQna(String mqcode) {
		return qDao.deletMarketQna(mqcode);
	}

}
