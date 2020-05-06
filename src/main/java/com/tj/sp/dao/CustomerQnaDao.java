package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Customer;
import com.tj.sp.dto.Customer_qna;

public interface CustomerQnaDao {
	public List<CustomerQnaDao> customerQnaList(Customer_qna qna);
	public int totalCustomerQna();
	public Customer_qna getCustomerQnaDetail(String cqcode);
	public int writeCustomerQna(Customer_qna qna);
	public int modifyCustomerQna(Customer_qna qna);
	public int hitupCustomerQna(String cqcode);
	public int replyStepACustomerQna(Customer_qna qna);
	public int replyCustomerQna(Customer_qna qna);
	public int deletCustomerQna(String cqcode); 
}
