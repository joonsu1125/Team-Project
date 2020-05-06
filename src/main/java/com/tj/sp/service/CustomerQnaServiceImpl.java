package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.CustomerQnaDao;
import com.tj.sp.dto.Customer;
import com.tj.sp.dto.Customer_qna;
@Service
public class CustomerQnaServiceImpl implements CustomerQnaService {
	
	@Autowired
	CustomerQnaDao qDao;

	@Override
	public List<CustomerQnaDao> customerQnaList(Customer_qna qna) {
		return qDao.customerQnaList(qna);
	}

	@Override
	public int totalCustomerQna() {
		return qDao.totalCustomerQna();
	}

	@Override
	public Customer_qna getCustomerQnaDetail(String cqcode) {
		return qDao.getCustomerQnaDetail(cqcode);
	}

	@Override
	public int writeCustomerQna(Customer_qna qna) {
		return qDao.writeCustomerQna(qna);
	}

	@Override
	public int modifyCustomerQna(Customer_qna qna) {
		return qDao.modifyCustomerQna(qna);
	}

	@Override
	public int hitupCustomerQna(String cqcode) {
		return qDao.hitupCustomerQna(cqcode);
	}

	@Override
	public int replyStepACustomerQna(Customer_qna qna) {
		return qDao.replyStepACustomerQna(qna);
	}

	@Override
	public int replyCustomerQna(Customer_qna qna) {
		// 들여쓰기 처리
		qna.setCqstep(qna.getCqstep()+1);
		qna.setCqindent(qna.getCqindent()+1);
		return qDao.replyCustomerQna(qna);
	}

	@Override
	public int deletCustomerQna(String cqcode) {
		return qDao.deletCustomerQna(cqcode);
	}

}
