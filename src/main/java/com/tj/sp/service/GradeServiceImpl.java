package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.GradeDao;
import com.tj.sp.dto.Grade;
@Service
public class GradeServiceImpl implements GradeService {
	@Autowired
	private GradeDao gradeDao;
	@Override
	public List<Grade> getListGrade() {
		return gradeDao.getListGrade();
	}

}
