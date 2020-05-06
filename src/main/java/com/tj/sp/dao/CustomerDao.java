package com.tj.sp.dao;

import java.util.List;

import com.tj.sp.dto.Customer;

public interface CustomerDao {
	public Customer getCustomer(String cid);
	public Customer getSnsCustomer(String csnsid);
	public int idConfirm(String cid);
	public List<Customer> totlaCustomer(Customer customer);
	public int snsConfirm(Customer customer);
	public int snsIdConfirm(String csnsid);
	public int registCustomer(Customer customer);
	public int modifyCustomer(Customer customer);
	public int modifyCustomerAddrcode(Customer customer);
	public int emailConfirm(String cemail);
	public int deleteCustomer(String cid);
	public int upPoint(String cid);
	public int usePoint(Customer customer);
	public List<Customer> getListCidByGrade(String gcode);
	public int updateAddrList(Customer customer);
}
