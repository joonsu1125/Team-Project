package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.sp.dto.Coupon;
import com.tj.sp.dto.Mycoupon;
import com.tj.sp.service.CouponService;
import com.tj.sp.service.Customer_gradeService;
import com.tj.sp.service.GradeService;
import com.tj.sp.service.MycouponService;

@Controller
@RequestMapping("coupon")
public class CouponController {
	@Autowired
	private MycouponService mycouponService;
	@Autowired
	private CouponService couponService;
	@Autowired
	private GradeService gradeService;
	@RequestMapping(params="method=listMycoupon", method =RequestMethod.GET)
	public String listMycoupon(String cid, Model model) {
		model.addAttribute("list",mycouponService.listMycoupon("aaa"));
		return "coupontest";
	}
	@RequestMapping(params="method=adminCoupon", method =RequestMethod.GET)
	public String coupon(Model model) {
		model.addAttribute("coupon",couponService.getListCoupon());
		model.addAttribute("grade", gradeService.getListGrade());
		return "admin/coupon";
	}
	@RequestMapping(params="method=insertCoupon", method =RequestMethod.GET)
	public String insertCoupon(Model model, Coupon coupon) {
		model.addAttribute("insertResult", couponService.insertCoupon(coupon));
		return "admin/coupon";
	}
	@RequestMapping(params="method=giveCoupon", method =RequestMethod.GET)
	public String giveCoupon(Model model, Mycoupon mycoupon, String gcode) {
		model.addAttribute("giveResult", mycouponService.givecoupon(mycoupon, gcode));
		return "forward: coupon.do?method=adminCoupon";
	}
	
	@RequestMapping(params="method=myCoupon", method =RequestMethod.GET)
	public String myCoupon(String cid, Model model) {
		model.addAttribute("couponList", mycouponService.listMycoupon(cid));
		model.addAttribute("count", mycouponService.countCoupon(cid));
		return "member/myCoupon";
	}
	
}
