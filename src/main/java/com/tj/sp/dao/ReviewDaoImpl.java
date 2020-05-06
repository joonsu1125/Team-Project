package com.tj.sp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Review;
@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int cntReview(String pcode) {
		return sessionTemplate.selectOne("cntReview",pcode);
	}
	@Override
	public List<Review> listReview(Review review) {
		return sessionTemplate.selectList("listReview", review);
	}
	@Override
	public int insertReview(Review review) {
		return sessionTemplate.insert("insertReview", review);
	}
	@Override
	public int deleteReview(String rcode) {
		return sessionTemplate.delete("deleteReview", rcode);
	}

}
