package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.sp.dto.Order_detail_product_mid;
import com.tj.sp.service.Order_detail_product_midService;
import com.tj.sp.service.Sp_orderService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("Order_detail_product")
public class Order_detail_product_midController {
	@Autowired
	private Order_detail_product_midService order_detail_product_midService;
	@Autowired 
	private Sp_orderService sp_orderService;
	//회원별 구매 목록
	@RequestMapping(params="method=listOrder_detailByCid", method=RequestMethod.GET)
	public String listOrder_detailByCid(Model model, String pagenum, 
			Order_detail_product_mid order_detail_product_mid, String cid ) {
		Paging paging = new Paging(order_detail_product_midService.cntOrder_detailByCid(cid), pagenum, 10, 10);
		order_detail_product_mid.setCid(cid);
		order_detail_product_mid.setStartrow(paging.getStartrow());
		order_detail_product_mid.setEndrow(paging.getEndrow());
		model.addAttribute("list", 
				order_detail_product_midService.listOrder_detailByCid(order_detail_product_mid, pagenum) );
		model.addAttribute("paging", paging);
		return "member/myPage";
	}
	//마켓별 구매 목록
	@RequestMapping(params="method=listOrder_detailByMid", method=RequestMethod.GET)
	public String listOrder_detailByMid(Model model, String pagenum, 
			Order_detail_product_mid order_detail_product_mid ) {
		model.addAttribute("list", 
				order_detail_product_midService.listOrder_detailByMid(order_detail_product_mid, pagenum) );
		return "order/statusOrder";
	}
	//구매 확정
	@RequestMapping(params="method=updateSp_order", method=RequestMethod.GET)
	public String updateSp_order(Model model, String ocode, String cid, String pagenum) {
		sp_orderService.updateSp_order(ocode);
		return "redirect: Order_detail_product.do?method=listOrder_detailByCid&cid="+cid+"&pagenum="+pagenum;
	}
}
