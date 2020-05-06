package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.sp.dto.Product_Product_option;
import com.tj.sp.dto.Review;
import com.tj.sp.service.ProductService;
import com.tj.sp.service.Product_optionService;
import com.tj.sp.service.Product_qnaService;
import com.tj.sp.service.Product_typeService;
import com.tj.sp.service.ReviewService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private Product_qnaService  product_qnaService;
	@Autowired
	private Product_optionService product_optionService;
	@Autowired
	private Product_typeService product_typeService;
	@RequestMapping(params="method=detailProduct" )
	public String detailProduct(String pcode,Model model, String review_pagenum, String pagenum, String qna_pagenum) {
		model.addAttribute("detail",productService.detailProduct(pcode));
		//장바구니 담을 option list불러오기
		model.addAttribute("listForCart",product_optionService.listForCart(pcode));
		//qna불러오기
		Paging qna_paging = new Paging(product_qnaService.qnaCnt(pcode),qna_pagenum,10,5);
		model.addAttribute("product_qna",product_qnaService.productQnaList(pcode, qna_pagenum));
		model.addAttribute("qna_paging",qna_paging);
		//리뷰 불러오기
		Review review = new Review();
		review.setPcode(pcode);
		model.addAttribute("review", reviewService.listReview(review, review_pagenum));
		Paging review_paging = new Paging(reviewService.cntReview(pcode), review_pagenum, 10, 5);
		model.addAttribute("review_paging", review_paging);
		return "product/detailProduct";
	}
	@RequestMapping(params = "method=joinList")
	public String joinList(String pagenum, Model model, Product_Product_option ppo) {
		Paging paging = new Paging(productService.cntProduct(), pagenum, 6, 3);
		model.addAttribute("paging", paging);
		model.addAttribute("joinList", productService.product_Product_optionList(pagenum, ppo));
		return "product/joinList";
	}
	@RequestMapping(params = "method=productRegister", method={RequestMethod.GET, RequestMethod.POST})
	public String productRegister(Model model) {
		model.addAttribute("type",product_typeService.getListProduct_type());
		return "product/productRegister";
	}
	@RequestMapping(params = "method=pRegister", method=RequestMethod.POST)
	public String pRegister(MultipartHttpServletRequest mRequest, Product_Product_option ppo, Model model) {
		productService.registerProduct(mRequest, ppo);
		model.addAttribute("result", product_optionService.registerProduct_option(mRequest));
		model.addAttribute("type",product_typeService.getListProduct_type());
		return "product/productRegister";
	}
}
