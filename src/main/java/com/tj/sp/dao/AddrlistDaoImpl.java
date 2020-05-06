package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Addrlist;
@Repository
public class AddrlistDaoImpl implements AddrlistDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List<Addrlist> listAddrlist(String cid) {
		return sessionTemplate.selectList("listAddrlist", cid);
	}

	@Override
	public int registAddrlist(Addrlist addrlist) {
		return sessionTemplate.insert("registAddrlist",addrlist);
	}

	@Override
	public int modifyAddrlist(Addrlist addrlist) {
		return sessionTemplate.update("modifyAddrlist", addrlist);
	}

	@Override
	public int deleteAddrlist(String addrcode) {
		return sessionTemplate.delete("deleteAddrlist", addrcode);
	}

	@Override
	public String getFirstAddrCode() {
		return sessionTemplate.selectOne("getFirstAddrCode");
	}

	@Override
	public int cntAddrlist(String cid) {
		return sessionTemplate.selectOne("cntAddrlist", cid);
	}

	@Override
	public Addrlist getAddrcode(String addrcode) {
		return sessionTemplate.selectOne("getAddrcode",addrcode);
	}

}
