package com.tj.sp.service;

import com.tj.sp.dto.Customer_grade;

public interface Customer_gradeService {
	public Customer_grade getCustomer_grade(String cid);
	public int updateGrade(String cid);
}
