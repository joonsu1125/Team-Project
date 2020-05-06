package com.tj.sp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Admin;
@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public Admin getAdmin(String aid) {
		return sessionTemplate.selectOne("getAdmin", aid);
	}
}
