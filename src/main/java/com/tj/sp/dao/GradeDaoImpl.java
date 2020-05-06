package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Grade;
@Repository
public class GradeDaoImpl implements GradeDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<Grade> getListGrade() {
		return sessionTemplate.selectList("getListGrade");
	}

}
