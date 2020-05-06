package com.tj.sp.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Customer;
@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public Customer getCustomer(String cid) {
		return sessionTemplate.selectOne("getCustomer" ,cid);
	}
	@Override
	public int idConfirm(String cid) {
		// 회원가입시 아이디 중복 체크
		return sessionTemplate.selectOne("idConfirm", cid);
	}
	@Override
	public List<Customer> totlaCustomer(Customer customer) {
		// 전체 회원 목록 가져오기
		return sessionTemplate.selectList("totlaCustomer", customer);
	}
	@Override
	public int snsConfirm(Customer customer) {
		// SNS로 로그인시 해당 SNS명과 SNSID가 있는지 검색
		return sessionTemplate.selectOne("snsConfirm", customer);
	}
	@Override
	public int registCustomer(Customer customer) {
		// 회원가입하기
		return sessionTemplate.insert("registCustomer", customer);
	}
	@Override
	public int modifyCustomer(Customer customer) {
		// 회원정보 수정
		return sessionTemplate.update("modifyCustomer", customer);
	}
	@Override
	public int modifyCustomerAddrcode(Customer customer) {
		// 회원주소코드 수정
		return sessionTemplate.update("modifyCustomerAddrcode", customer);
	}
	@Override
	public int emailConfirm(String cemail) {
		// 회원정보 수정시 이메일 중복 체크
		return sessionTemplate.selectOne("emailConfirm", cemail);
	}
	@Override
	public int deleteCustomer(String cid) {
		// 회원 탈퇴
		return sessionTemplate.delete("deleteCustomer", cid);
	}
	@Override
	public int snsIdConfirm(String csnsid) {
		// 회원DB에 snsid가 있는지 확인
		return sessionTemplate.selectOne("snsIdConfirm", csnsid);
	}
	@Override
	public Customer getSnsCustomer(String csnsid) {
		// snsid로 회원정보 가져오기
		return sessionTemplate.selectOne("getSnsCustomer", csnsid);
	}
	@Override
	public int upPoint(String cid) {
		// 구매시 포인트 적립
		return sessionTemplate.update("upPoint", cid);
	}
	@Override
	public int usePoint(Customer customer) {
		// 포인트 사용
		return sessionTemplate.update("usePoint", customer);
	}
	@Override
	public List<Customer> getListCidByGrade(String gcode) {
		return sessionTemplate.selectList("getListCidByGrade", gcode);
	}
	@Override
	public int updateAddrList(Customer customer) {
		// addrname 업데이트
		return sessionTemplate.update("updateAddrList", customer);
	}

}
