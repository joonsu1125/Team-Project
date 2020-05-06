package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.sp.dto.Product_Product_option;
import com.tj.sp.service.ProductService;
import com.tj.sp.util.Paging;

@Controller
public class MainController {
	@Autowired
	private ProductService productService;
	@RequestMapping(value="main")
	public String main(String pagenum, Model model, Product_Product_option product_Product_option) {
		Paging paging = new Paging(productService.cntProduct_Product_optionList(product_Product_option), pagenum, 6, 3);
		model.addAttribute("paging", paging);
		model.addAttribute("joinList", productService.product_Product_optionList(pagenum, product_Product_option));
		return "main/main";
	}
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "write";
	}
	@RequestMapping(value="myPage")
	public String myPage() {
		return "member/myPage";
	}

	/*
	 * @RequestMapping(value="myAddressList") public String myAddressList() { return
	 * "member/myAddressList"; }
	 */
	@RequestMapping(value="myCoupon")
	public  String myCoupon() {
		return "member/myCoupon";
	}
}
