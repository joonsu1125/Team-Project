package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.AddrlistDao;
import com.tj.sp.dto.Addrlist;
@Service
public class AddrlistServiceImpl implements AddrlistService {
	@Autowired
	private AddrlistDao addrlistDao;
	
	@Override
	public List<Addrlist> listAddrlist(String cid) {
		// 고객아이디로 주소목록 가져오기
		return addrlistDao.listAddrlist(cid);
	}

	@Override
	public int registAddrlist(Addrlist addrlist) {
		// 주소목록 등록하기
		return addrlistDao.registAddrlist(addrlist);
	}

	@Override
	public int modifyAddrlist(Addrlist addrlist) {
		// 주소목록 수정하기
		return addrlistDao.modifyAddrlist(addrlist);
	}

	@Override
	public int deleteAddrlist(String addrcode) {
		// 선택한 주소목록 삭제하기
		return addrlistDao.deleteAddrlist(addrcode);
	}

	@Override
	public String getFirstAddrCode() {
		// 회원가입시 addrname 가져오기
		return addrlistDao.getFirstAddrCode();
	}

	@Override
	public int cntAddrlist(String cid) {
		// 해당 회원에 등록된 주소록 숫자 가져오기
		return addrlistDao.cntAddrlist(cid);
	}

	@Override
	public Addrlist getAddrcode(String addrcode) {
		// addrcode로 회원 주소록 가져오기
		return addrlistDao.getAddrcode(addrcode);
	}

}
