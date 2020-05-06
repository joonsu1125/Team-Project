package com.tj.sp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.sp.dto.Customer;
import com.tj.sp.dto.Market;
import com.tj.sp.dto.Product;
import com.tj.sp.service.MarketService;
import com.tj.sp.service.ProductService;
import com.tj.sp.service.Product_qnaService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("market")
public class MarketController {
	@Autowired
	private ProductService productService;
	@Autowired
	private MarketService marketService;
	@Autowired
	private Product_qnaService product_qnaService;
	@RequestMapping(params = "method=marketmain")
	public String marketMain(String pagenum, Model model, Product product, String schword, String mid) {
		//마켓정보 불러오기
		model.addAttribute("market_header",marketService.getMarket(mid));		
		//마켓메인용 제품 리스트 뿌리기
		Paging paging = new Paging(productService.cntMarketMain(product), pagenum, 6, 3);
		model.addAttribute("paging", paging);
		model.addAttribute("marketmain", productService.marketMain(product, pagenum, schword));
		return "market/marketmain";
	}
	@RequestMapping(params ="method=unAnswerList")
	public String cntUnansweredQnaList(String pagenum, Model model, Product product) {
		Paging paging = new Paging(product_qnaService.cntUnansweredQnaList(product), pagenum, 10, 5);
		model.addAttribute("paging", paging);
		model.addAttribute("unAnswerList", product_qnaService.unansweredQnaList(product, pagenum));
		return "market/unAnswerList";
	}
	
	@RequestMapping(params ="method=marketJoinResult")
	public String marketJoinResult(Market market, Model model) {
		System.out.println("market : "+market.toString());
		// 마켓 등록
		int result = marketService.registMarket(market);
		if(result == 1) {
			model.addAttribute("joinResult", "마켓등록 성공");
			model.addAttribute("market", marketService.getMarket(market.getMid()));
		} else {
			model.addAttribute("joinResult", "마켓등록 실패");
		}
		
		return "market/login";
	}
	
	@RequestMapping(params="method=idConfirm")
	public String marketIdConfirm(String mid, Model model) {
		
		boolean idResult = true; // 사용가능
		if (marketService.getMarket(mid) != null) {
			idResult = false;
		}

		if (idResult) {
			model.addAttribute("idConfirmResult", "가입가능");
		} else {
			model.addAttribute("idConfirmResult", "중복");
		}

		return "market/idConfirm";
	}
	
	@RequestMapping(params ="method=marketJoin")
	public String marketJoin() {
		return "market/marketJoin";
	}
	
	@RequestMapping(params ="method=marketLogin")
	public String marketLogin() {
		return "market/login";
	}
	
	@RequestMapping(params="method=login")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		System.out.println("===============method=login===============");
			
		// 상점 로그인한경우
		System.out.println("marketLogin!!!!!!");
		String mid = request.getParameter("id");
		String mpw = request.getParameter("pw");
		
		System.out.println("mid : " + mid);
		System.out.println("mpw : " + mpw);
		Market market = marketService.getMarket(mid);
		if (market != null) {
			if(market.getMpw().equals(mpw)) {
				// 비밀번호 일치
				session.setAttribute("market", market);
				session.setAttribute("mid", market.getMid());
				model.addAttribute("market", market);
				model.addAttribute("result", "로그인 성공");
				System.out.println("로그인 성공");
			} else {
				// 비밀번호 불일치
				model.addAttribute("errMsg", "비밀번호를 확인해주세요");
				model.addAttribute("mid", mid);
				System.out.println("로그인 실패");
				return "forward:market.do?method=marketLogin";
			}
			
		} else {
			// 아이디 불일치
			model.addAttribute("errMsg", "아이디를 확인해주세요");
			System.out.println("로그인 실패 아이디부터 없음");
			return "forward:market.do?method=marketLogin";
		}
		
				
		//return "login/login";
		return "forward:main.do";
	}
	
	
}
