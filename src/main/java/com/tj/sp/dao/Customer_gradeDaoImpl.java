package com.tj.sp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Customer_grade;
@Repository
public class Customer_gradeDaoImpl implements Customer_gradeDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public Customer_grade getCustomer_grade(String cid) {
		return sessionTemplate.selectOne("getCustomer_grade" ,cid);
	}
	@Override
	public int updateGrade(String cid) {
		return sessionTemplate.update("updateGrade", cid);
	}

}
