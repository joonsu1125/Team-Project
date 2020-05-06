package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Store_qna;
@Repository
public class StoreQnaDaoImpl implements StoreQnaDao {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<Store_qna> storeQnaList(Store_qna qna) {
		// 글 목록 가져오기
		return sessionTemplate.selectList("storeQnaList", qna);
	}

	@Override
	public int totalStoreQna() {
		// 전체 글 갯수 가져오기
		return sessionTemplate.selectOne("totalStoreQna");
	}

	@Override
	public Store_qna getStoreQnaDetail(String sqcode) {
		// 상세글 보기
		return sessionTemplate.selectOne("getStoreQnaDetail", sqcode);
	}

	@Override
	public int writeStoreQna(Store_qna qna) {
		// 원글 쓰기
		return sessionTemplate.insert("writeStoreQna", qna);
	}

	@Override
	public int modifyStoreQna(Store_qna qna) {
		// 글 수정하기
		return sessionTemplate.update("modifyStoreQna", qna);
	}

	@Override
	public int hitupStoreQna(String sqcode) {
		// 조회수 올리기
		return sessionTemplate.update("hitupStoreQna", sqcode);
	}

	@Override
	public int replyStepAStoreQna(Store_qna qna) {
		// 답변글 달기전 stepA
		return sessionTemplate.update("replyStepAStoreQna", qna);
	}

	@Override
	public int replyStoreQna(Store_qna qna) {
		// 답변글 달기
		return sessionTemplate.insert("replyStoreQna", qna);
	}

	@Override
	public int deletStoreQna(String sqcode) {
		// 글 삭제하기
		return sessionTemplate.delete("deletStoreQna", sqcode);
	}

}
