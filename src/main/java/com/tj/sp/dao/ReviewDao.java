package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Review;

public interface ReviewDao {
	public int cntReview(String pcode);
	public List<Review> listReview(Review review);
	public int insertReview(Review review);
	public int deleteReview(String rcode);
}
