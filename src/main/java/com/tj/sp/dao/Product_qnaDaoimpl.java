package com.tj.sp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Product;
import com.tj.sp.dto.Product_qna;
@Repository
public class Product_qnaDaoimpl implements Product_qnaDao{
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int writeQna(Product_qna product_qna) {
		return sessionTemplate.insert("writeQna",product_qna);
	}

	@Override
	public int modifyQna(Product_qna product_qna) {
		System.out.println("수정할 데이터(DAO) : "+product_qna);
		return sessionTemplate.update("modifyQna",product_qna);
	}

	@Override
	public List<Product_qna> productQnaList(Product_qna product_qna) {
		return sessionTemplate.selectList("productQnaList",product_qna);
	}

	@Override
	public int deleteQna(String pqcode) {
		return sessionTemplate.delete("deleteQna",pqcode);
	}

	@Override
	public Product_qna getQna(Product_qna product_qna) {
		return sessionTemplate.selectOne("getQna",product_qna);
	}

	@Override
	public int qnaCnt(String pcode) {
		return sessionTemplate.selectOne("qnaCnt", pcode);
	}

	@Override
	public List<Product_qna> unansweredQnaList(Product product) {
		return sessionTemplate.selectList("unansweredQnaList", product);
	}

	@Override
	public int cntUnansweredQnaList(Product product) {
		return sessionTemplate.selectOne("cntUnansweredQnaList", product);
	}
	@Override
	public int replyQna(Product_qna product_qna) {
		return sessionTemplate.update("replyQna",product_qna);
	}
}
