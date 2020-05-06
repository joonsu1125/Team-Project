package com.tj.sp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.CustomerDao;
import com.tj.sp.dto.Customer;
@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public Customer getCustomer(String cid) {
		return customerDao.getCustomer(cid);
	}
	
	@Override
	public int idConfirm(String cid) {
		return customerDao.idConfirm(cid);
	}
	
	@Override
	public List<Customer> totlaCustomer(Customer customer) {
		return customerDao.totlaCustomer(customer);
	}
	
	@Override
	public int snsConfirm(Customer customer) {
		return customerDao.snsConfirm(customer);
	}
	
	@Override
	public int registCustomer(Customer customer) {
		return customerDao.registCustomer(customer);
	}
	
	@Override
	public int modifyCustomer(Customer customer) {
		return customerDao.modifyCustomer(customer);
	}
	
	@Override
	public int modifyCustomerAddrcode(Customer customer) {
		return customerDao.modifyCustomerAddrcode(customer);
	}
	
	@Override
	public int emailConfirm(String cemail) {
		return customerDao.emailConfirm(cemail);
	}
	
	@Override
	public int deleteCustomer(String cid) {
		return customerDao.deleteCustomer(cid);
	}

	@Override
	public int snsIdConfirm(String csnsid) {
		return customerDao.snsIdConfirm(csnsid);
	}

	@Override
	public Customer getSnsCustomer(String csnsid) {
		return customerDao.getSnsCustomer(csnsid);
	}
	
	@Override
	public int upPoint(String cid) {
		return customerDao.upPoint(cid);
	}

	@Override
	public int usePoint(Customer customer) {
		return customerDao.usePoint(customer);
	}

	@Override
	public int updateAddrList(Customer customer) {
		return customerDao.updateAddrList(customer);
	}

}
