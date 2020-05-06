package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.sp.dto.Customer_qna;
import com.tj.sp.service.CustomerQnaService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("customerQna")
public class CustomerQnaController {
	
	private static final int SUCCESS = 1;
	private static final int FAIL = 0;
	
	// 글쓰기 중복 방지
	private boolean writable = false;
	
	@Autowired
	private CustomerQnaService qService;
	
	// 게시판 리스트화면 호출
	@RequestMapping(params="method=qnaList")
	public String qnaList(String pageNum, Model model, Customer_qna qna) {
		// 페이징 처리
		Paging paging = new Paging(qService.totalCustomerQna(), pageNum, 10, 10);
		qna.setStartrow(paging.getStartrow());
		qna.setEndrow(paging.getEndrow());
		
		//model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", qService.customerQnaList(qna));
		model.addAttribute("paging", paging);
		return "customerQna/qnaList";
	}
	
	// 글쓰기 폼 호출
	@RequestMapping(params="method=writeForm")
	public String registerForm() {
		writable = true;
		return "customerQna/qnaWriteForm";
	}
	
	// 원글 쓰기
	@RequestMapping(params="method=write")
	public String write(Customer_qna qna, Model model) {
		if (writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			int result = qService.writeCustomerQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 작성 성공");
				return "forward:customerQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 작성 실패");
				return "forward:customerQna.do?method=writeForm";
			}			
		}
		return "forward:customerQna.do?method=qnaList";
	}
	
	// 답변글 달기 폼 호출
	@RequestMapping(params="method=replyForm")
	public String replyForm(String cqcode, Model model) {
		writable = true;
		model.addAttribute("cqcode", cqcode);
		model.addAttribute("detail", qService.getCustomerQnaDetail(cqcode));
		return "customerQna/qnaReplyForm";
	}
	
	// 답변글 달기
	@RequestMapping(params="method=reply")
	public String reply(String pageNum, Customer_qna qna, Model model) {
		if(writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			// 스텝 A진행
			qService.replyStepACustomerQna(qna);
			System.out.println("reply-qna : "+ qna.toString());
			// 답변 달기
			int result = qService.replyCustomerQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 답변작성 성공");
				return "forward:customerQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 답변작성 실패");
				return "forward:customerQna.do?method=writeForm";
			}			
		}
		return "forward:customerQna.do?method=qnaList";
	}
	
	// 글 상세보기
	@RequestMapping(params="method=detail")
	public String detail(Model model, String cqcode) {
		qService.hitupCustomerQna(cqcode);
		model.addAttribute("detail", qService.getCustomerQnaDetail(cqcode));
		return "customerQna/qnaDetail";
	}
	
	// 글 수정하기 폼 호출
	@RequestMapping(params="method=modifyForm")
	public String modifyForm(String pageNum, String cqcode, Model model) {
		writable = true;
		model.addAttribute("modify", qService.getCustomerQnaDetail(cqcode));
		return "customerQna/qnaModifyForm";
	}
	
	// 글 수정하기
	@RequestMapping(params="method=modify")
	public String modify(String pageNum, Customer_qna qna, Model model) {
		if (writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			System.out.println(qna.toString());
			int result = qService.modifyCustomerQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 수정 성공");
				return "forward:customerQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 수정 실패");
				return "forward:customerQna.do?method=modifyForm";
			}			
		}
		return "forward:customerQna.do?method=qnaList";
	}
	
	// 글 삭제하기
	@RequestMapping(params="method=delete")
	public String delete(String pageNum, String cqcode, Model model) {
		//Customer_qna qna = qService.getCustomerQnaDetail(cqcode);
		int result = qService.deletCustomerQna(cqcode);
		if(result == SUCCESS) {
			model.addAttribute("resultMsg", "Q&A 문의 삭제 성공");
			return "forward:customerQna.do?method=qnaList";
		} else {
			model.addAttribute("resultMsg", "Q&A 문의 삭제 실패");
			return "forward:customerQna.do?method=modifyForm";
		}
	}

}
