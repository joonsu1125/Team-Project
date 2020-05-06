package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.StoreQnaDao;
import com.tj.sp.dto.Store_qna;
@Service
public class StoreQnaServiceImpl implements StoreQnaService {
	
	@Autowired
	StoreQnaDao qDao;

	@Override
	public List<Store_qna> storeQnaList(Store_qna qna) {
		return qDao.storeQnaList(qna);
	}

	@Override
	public int totalStoreQna() {
		return qDao.totalStoreQna();
	}

	@Override
	public Store_qna getStoreQnaDetail(String sqcode) {
		return qDao.getStoreQnaDetail(sqcode);
	}

	@Override
	public int writeStoreQna(Store_qna qna) {
		return qDao.writeStoreQna(qna);
	}

	@Override
	public int modifyStoreQna(Store_qna qna) {
		return qDao.modifyStoreQna(qna);
	}

	@Override
	public int hitupStoreQna(String sqcode) {
		return qDao.hitupStoreQna(sqcode);
	}

	@Override
	public int replyStepAStoreQna(Store_qna qna) {
		return qDao.replyStepAStoreQna(qna);
	}

	@Override
	public int replyStoreQna(Store_qna qna) {
		// 들여쓰기 처리
		qna.setSqstep(qna.getSqstep()+1);
		qna.setSqindent(qna.getSqindent()+1);
		return qDao.replyStoreQna(qna);
	}

	@Override
	public int deletStoreQna(String sqcode) {
		return qDao.deletStoreQna(sqcode);
	}

}
