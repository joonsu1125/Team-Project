package com.tj.sp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.sp.dao.AddrlistDao;
import com.tj.sp.dto.Addrlist;
import com.tj.sp.dto.Customer;
import com.tj.sp.service.AddrlistService;
import com.tj.sp.service.CustomerService;

@Controller
@RequestMapping("myAddressList")
public class AddrlistController {
	
	public static final int SUCCESS = 1;
	
	@Autowired
	private AddrlistDao addrDao;
	@Autowired
	private AddrlistService addrService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(params="method=myAddress")
	public String myAddressList(String cid, Model model) {
		// 주소목록 가져오기
		System.out.println("myAddr cid  : " + cid);
		int cnt = addrService.cntAddrlist(cid);
		System.out.println("myAddr cnt  : " + cnt);
		List<Addrlist> list = addrService.listAddrlist(cid);
		System.out.println("myAddr list  : " + list.toString());
		model.addAttribute("addrCnt", addrDao.cntAddrlist(cid));
		model.addAttribute("myAddrList", addrService.listAddrlist(cid));
		return "member/myAddressList";
	}
	
	@RequestMapping(params="method=insertAddrForm")
	public String insertAddrForm(String cid, Model model) {
		// 주소등록하기 화면 호출
		return "member/insertAddrForm";
	}
	
	@RequestMapping(params="method=insertAddr")
	public String insertAddr(Addrlist addrlist, Model model) {
		// 주소등록하기
		System.out.println(addrlist.toString());
		String cid = addrlist.getCid();
		int result = addrService.registAddrlist(addrlist);
		if(result == SUCCESS) {
			model.addAttribute("addrMsg", "주소추가 성공");
		} else {
			model.addAttribute("addrMsg", "주소추가 실패");
		}
		return myAddressList(cid, model);
	}
	
	@RequestMapping(params="method=modifyAddrForm")
	public String modifyAddrForm(String addrcode, Model model) {
		// 주소수정 화면 호출
		System.out.println("addrcode : "+addrcode);
		model.addAttribute("addrlist", addrService.getAddrcode(addrcode));
		return "member/modifyAddrForm";
	}
	
	@RequestMapping(params="method=modifyAddr")
	public String modifyAddr(Addrlist addrlist, Model model) {
		// 주소등록하기
		System.out.println(addrlist.toString());
		String cid = addrlist.getCid();
		int result = addrService.modifyAddrlist(addrlist);
		if(result == SUCCESS) {
			model.addAttribute("addrMsg", "주소 수정 성공");
		} else {
			model.addAttribute("addrMsg", "주소 수정 실패");
		}
		return myAddressList(cid, model);
	}
	
	@RequestMapping(params="method=deleteAddr")
	public String deleteAddr(String cid, String addrcode, Model model) {
		// 주소삭제
		System.out.println("AddrDelete cid : "+cid);
		System.out.println("AddrDelete addrcode : "+addrcode);
		int result = addrService.deleteAddrlist(addrcode);
		if(result == SUCCESS) {
			model.addAttribute("addrMsg", "주소 삭제 성공");
		} else {
			model.addAttribute("addrMsg", "주소 삭제 실패");
		}
		return myAddressList(cid, model);
	}
	
	@RequestMapping(params="method=defaultAddr")
	public String defaultAddr(String cid, String addrcode, Model model, HttpSession session) {
		// 기본주소 설정
		System.out.println("defaultAddr cid : "+cid);
		System.out.println("defaultAddr addrcode : "+addrcode);
		Customer customer = new Customer();
		customer.setCid(cid);
		customer.setAddrcode(addrcode);
		
		System.out.println("defaultAddr customer : "+customer.toString());
		int result = customerService.modifyCustomerAddrcode(customer);
		if(result == SUCCESS) {
			model.addAttribute("addrMsg", "기본주소 설정 성공");
			session.setAttribute("member", customerService.getCustomer(cid));
		} else {
			model.addAttribute("addrMsg", "기본주소 설정 실패");
		}
		return myAddressList(cid, model);
	}

}
