package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Customer;
import com.tj.sp.dto.Customer_qna;
@Repository
public class CustomerQnaDaoImpl implements CustomerQnaDao {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List<CustomerQnaDao> customerQnaList(Customer_qna qna) {
		// 글 목록 가져오기
		return sessionTemplate.selectList("customerQnaList", qna);
	}

	@Override
	public int totalCustomerQna() {
		// 전체 글 갯수 가져오기
		return sessionTemplate.selectOne("totalCustomerQna");
	}

	@Override
	public Customer_qna getCustomerQnaDetail(String cqcode) {
		// 상세글 보기
		return sessionTemplate.selectOne("getCustomerQnaDetail", cqcode);
	}

	@Override
	public int writeCustomerQna(Customer_qna qna) {
		// 원글 쓰기
		return sessionTemplate.insert("writeCustomerQna", qna);
	}

	@Override
	public int modifyCustomerQna(Customer_qna qna) {
		// 글 수정하기
		return sessionTemplate.update("modifyCustomerQna", qna);
	}

	@Override
	public int hitupCustomerQna(String cqcode) {
		// 조회수 올리기
		return sessionTemplate.update("hitupCustomerQna", cqcode);
	}

	@Override
	public int replyStepACustomerQna(Customer_qna qna) {
		// 답변글 달기전 stepA
		return sessionTemplate.update("replyStepACustomerQna", qna);
	}

	@Override
	public int replyCustomerQna(Customer_qna qna) {
		// 답변글 달기
		return sessionTemplate.insert("replyCustomerQna", qna);
	}

	@Override
	public int deletCustomerQna(String cqcode) {
		// 글 삭제하기
		return sessionTemplate.delete("deletCustomerQna", cqcode);
	}

}
