package com.tj.sp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.sp.dao.AdminDao;
import com.tj.sp.dao.CartDao;
import com.tj.sp.dao.CustomerDao;
import com.tj.sp.dto.Admin;
import com.tj.sp.dto.Customer;

@Controller
@RequestMapping("login")
public class LoginController {
	
	private static final int MEMBER_EXIST = 1;
	private static final int MEMBER_NONEXIST = 0;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private CartDao cartDao;
	
	@RequestMapping(params="method=loginForm")
	public String loginForm() {
		
		return "login/loginForm";
	}
	
	@RequestMapping(params="method=adminLogin")
	public String adminLogin(HttpServletRequest request, Model model, HttpSession session) {
		// 관리자 로그인
		System.out.println("adminLogin!!!!!!");
		String aid = request.getParameter("id");
		String apw = request.getParameter("pw");
		
		System.out.println("id : " + aid);
		System.out.println("pw : " + apw);
		
		Admin admin = adminDao.getAdmin(aid);
		
		if (admin != null) {
			if(admin.getApw().equals(apw)) {
				// 비밀번호 일치
				session.setAttribute("admin", admin);
				session.setAttribute("aid", admin.getAid());
				model.addAttribute("admin", admin);
				model.addAttribute("result", "관리자 로그인 성공");
				System.out.println("관리자 로그인 성공");
			} else {
				// 비밀번호 불일치
				model.addAttribute("errMsg", "비밀번호를 확인해주세요");
				System.out.println("관리자 로그인 실패");
			}
			
		} else {
			// 아이디 불일치
			model.addAttribute("errMsg", "아이디를 확인해주세요");
			System.out.println("로그인 실패 아이디부터 없음");
		}
		
		return "forward:main.do";
	}
	@RequestMapping(params="method=login")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		
		String csnsid = request.getParameter("snsid");
		String provider = request.getParameter("provider");
		String snsemail = request.getParameter("snsemail");
		
		if (csnsid != "") {
			// sns로 로그인 한경우
			System.out.println("snslogin!!!!!!");
			System.out.println("snsid : " + csnsid);
			System.out.println("provider : " + provider);
			System.out.println("snsemail : " + snsemail);
			
			//customerDao.snsConfirm(customer);
			if(customerDao.snsIdConfirm(csnsid) == MEMBER_EXIST) {
				// 회원DB에 등록되있으면 회원정보 가져와서 메인화면으로 가기
				model.addAttribute("member", customerDao.getSnsCustomer(csnsid));
				session.setAttribute("member", customerDao.getSnsCustomer(csnsid));
				String cid = customerDao.getSnsCustomer(csnsid).getCid();
				session.setAttribute("numberCart", cartDao.numberCart(cid));
				System.out.println("sns 로그인 성공");
			} else {
				// 회원DB에 등록 안되있으면 회원가입처리하기
				model.addAttribute("csnsid", csnsid);
				model.addAttribute("provider", provider);
				model.addAttribute("snsemail", snsemail);
				
				return "forward:member.do?method=memberJoin";
			}
			
		} else {
			// 일반 로그인한경우
			System.out.println("customerlogin!!!!!!");
			String cid = request.getParameter("id");
			String cpw = request.getParameter("pw");
			
			System.out.println("id : " + cid);
			System.out.println("pw : " + cpw);
			
			Customer customer = customerDao.getCustomer(cid);
			if (customer != null) {
				if(customer.getCpw().equals(cpw)) {
					// 비밀번호 일치
					session.setAttribute("member", customer);
					session.setAttribute("cid", customer.getCid());
					model.addAttribute("member", customer);
					model.addAttribute("result", "로그인 성공");
					session.setAttribute("numberCart", cartDao.numberCart(cid));
					System.out.println("로그인 성공");
				} else {
					// 비밀번호 불일치
					model.addAttribute("errMsg", "비밀번호를 확인해주세요");
					model.addAttribute("cid", cid);
					System.out.println("로그인 실패");
					return "forward:login.do?method=memberLogin";
				}
				
			} else {
				// 아이디 불일치
				model.addAttribute("errMsg", "아이디를 확인해주세요");
				System.out.println("로그인 실패 아이디부터 없음");
				return "forward:login.do?method=memberLogin";
			}
		}
				
		//return "login/login";
		return "forward:main.do";
	}
	
	@RequestMapping(params="method=kakao")
	public String loginKakao(HttpServletRequest request) {
		System.out.println("kakao login!!!");
		String csnsid = request.getParameter("snsid");
		String provider = request.getParameter("provider");
		String snsemail = request.getParameter("snsemail");
		
		System.out.println("snsid : " + csnsid);
		System.out.println("provider : " + provider);
		System.out.println("snsemail : " + snsemail);
		
		//customerDao.snsConfirm(customer);
		int result = customerDao.snsIdConfirm(csnsid);
		System.out.println("result"+result);
		
		return "main/main";
	}
	
	@RequestMapping(params="method=google")
	public String loginGoogle(HttpServletRequest request) {
		System.out.println("google login!!!");
		return "main/main";
	}
	
	@RequestMapping(params="method=logout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		System.out.println("logout!!!");
		return "redirect:main.do";
	}
	
	@RequestMapping(params="method=join")
	public String join(HttpSession httpSession) {
		return "login/joinForm";
	}

	@RequestMapping(params="method=memberLogin")
	public String memberLogin() {
		return "login/login";
	}
	
	@RequestMapping(params="method=adminLoginForm")
	public String adminLoginForm() {
		return "login/adminLogin";
	}
	
	
		
}
