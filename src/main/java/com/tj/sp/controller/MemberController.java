package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.sp.dto.Addrlist;
import com.tj.sp.dto.Customer;
import com.tj.sp.service.AddrlistService;
import com.tj.sp.service.CustomerService;
import com.tj.sp.service.Customer_gradeService;
import com.tj.sp.service.Order_detail_product_midService;


@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private Customer_gradeService customer_gradeService;
	@Autowired
	private Order_detail_product_midService order_detail_product_midService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private AddrlistService addrListService;
	@RequestMapping(params="method=memberJoin")
	public String memberJoin() {	
		return "member/memberJoin";
	}
	@RequestMapping(params="method=grade")
	public String memberGrade(String cid, Model model) {
		model.addAttribute("member", customer_gradeService.getCustomer_grade(cid));
		model.addAttribute("count", order_detail_product_midService.cntOrder_detailByCid(cid));
		return "member/grade";
	}
	
	@RequestMapping(params="method=idConfirm")
	public String customerIdConfirm(String cid, Model model) {
		boolean idResult = true; // 사용가능
		if (customerService.getCustomer(cid) != null) {
			idResult = false;
		}

		if (idResult) {
			model.addAttribute("idConfirmResult", "가입가능");
		} else {
			model.addAttribute("idConfirmResult", "중복");
		}

		return "member/idConfirm";
	}
	
	@RequestMapping(params="method=cutomerJoinResult")
	public String cutomerJoinResult(Customer customer, Addrlist addrlist, Model model) {
	
		// 회원 등록
		int result = customerService.registCustomer(customer);
		if (result == 1) {
			// 고객 주소 등록
			result = addrListService.registAddrlist(addrlist);
			if(result == 1) {
				// addrname 가져오기
				String addrCode = addrListService.getFirstAddrCode();
				customer.setAddrcode(addrCode);
				// customer에 addrname 업데이트하기
				customerService.updateAddrList(customer);
				model.addAttribute("joinResult", "회원가입 성공");
				model.addAttribute("customer", customerService.getCustomer(customer.getCid()));
			} else {
				model.addAttribute("resultJoin", "주소등록 실패");
			}
		} else {
			model.addAttribute("resultJoin", "회원가입 실패");
		}
		return "login/login";
	}
	
}
