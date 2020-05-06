package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Store_qna;

public interface StoreQnaDao {
	public List<Store_qna> storeQnaList(Store_qna qna);
	public int totalStoreQna();
	public Store_qna getStoreQnaDetail(String sqcode);
	public int writeStoreQna(Store_qna qna);
	public int modifyStoreQna(Store_qna qna);
	public int hitupStoreQna(String sqcode);
	public int replyStepAStoreQna(Store_qna qna);
	public int replyStoreQna(Store_qna qna);
	public int deletStoreQna(String sqcode); 
}
