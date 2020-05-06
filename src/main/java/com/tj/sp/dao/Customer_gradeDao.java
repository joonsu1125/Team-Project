package com.tj.sp.dao;

import com.tj.sp.dto.Customer_grade;

public interface Customer_gradeDao {
	public Customer_grade getCustomer_grade(String cid);
	public int updateGrade(String cid);
}
