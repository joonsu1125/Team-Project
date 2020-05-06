package com.tj.sp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.AdminDao;
import com.tj.sp.dto.Admin;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Admin getAdmin(String aid) {
		return adminDao.getAdmin(aid);
	}

}
