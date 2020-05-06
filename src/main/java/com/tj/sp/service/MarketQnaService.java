package com.tj.sp.service;

import java.util.List;

import com.tj.sp.dto.Market_qna;
import com.tj.sp.dto.Store_qna;

public interface MarketQnaService {
	public List<Market_qna> marketQnaList(Market_qna qna);
	public int totalMarketQna();
	public Market_qna getMarketQnaDetail(String mqcode);
	public int writeMarketQna(Market_qna qna);
	public int modifyMarketQna(Market_qna qna);
	public int hitupMarketQna(String mqcode);
	public int replyStepAMarketQna(Market_qna qna);
	public int replyMarketQna(Market_qna qna);
	public int deletMarketQna(String mqcode); 
}
