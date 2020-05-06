package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.sp.dto.Market_qna;
import com.tj.sp.service.MarketQnaService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("marketQna")
public class MarketQnaController {
	
	private static final int SUCCESS = 1;
	private static final int FAIL = 0;
	
	// 글쓰기 중복 방지
	private boolean writable = false;
	
	@Autowired
	private MarketQnaService qService;
	
	// 게시판 리스트화면 호출
	@RequestMapping(params="method=qnaList")
	public String qnaList(String pageNum, Model model, Market_qna qna) {
		// 페이징 처리
		Paging paging = new Paging(qService.totalMarketQna(), pageNum, 10, 10);
		qna.setStartrow(paging.getStartrow());
		qna.setEndrow(paging.getEndrow());
		
		//model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", qService.marketQnaList(qna));
		model.addAttribute("paging", paging);
		return "marketQna/qnaList";
	}
	
	// 글쓰기 폼 호출
	@RequestMapping(params="method=writeForm")
	public String registerForm() {
		writable = true;
		return "marketQna/qnaWriteForm";
	}
	
	// 원글 쓰기
	@RequestMapping(params="method=write")
	public String write(Market_qna qna, Model model) {
		if (writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			System.out.println("write : "+qna.toString());
			int result = qService.writeMarketQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 작성 성공");
				return "forward:marketQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 작성 실패");
				return "forward:marketQna.do?method=writeForm";
			}			
		}
		return "forward:marketQna.do?method=qnaList";
	}
	
	// 답변글 달기 폼 호출
	@RequestMapping(params="method=replyForm")
	public String replyForm(String mqcode, Model model) {
		writable = true;
		model.addAttribute("mqcode", mqcode);
		model.addAttribute("detail", qService.getMarketQnaDetail(mqcode));
		return "marketQna/qnaReplyForm";
	}
	
	// 답변글 달기
	@RequestMapping(params="method=reply")
	public String reply(String pageNum, Market_qna qna, Model model) {
		if(writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			// 스텝 A진행
			qService.replyStepAMarketQna(qna);
			// 답변 달기
			int result = qService.replyMarketQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 답변작성 성공");
				return "forward:marketQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 답변작성 실패");
				return "forward:marketQna.do?method=writeForm";
			}			
		}
		return "forward:marketQna.do?method=qnaList";
	}
	
	// 글 상세보기
	@RequestMapping(params="method=detail")
	public String detail(Model model, String mqcode) {
		qService.hitupMarketQna(mqcode);
		model.addAttribute("detail", qService.getMarketQnaDetail(mqcode));
		return "marketQna/qnaDetail";
	}
	
	// 글 수정하기 폼 호출
	@RequestMapping(params="method=modifyForm")
	public String modifyForm(String pageNum, String mqcode, Model model) {
		writable = true;
		model.addAttribute("modify", qService.getMarketQnaDetail(mqcode));
		return "marketQna/qnaModifyForm";
	}
	
	// 글 수정하기
	@RequestMapping(params="method=modify")
	public String modify(String pageNum, Market_qna qna, Model model) {
		if (writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			int result = qService.modifyMarketQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 수정 성공");
				return "forward:marketQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 수정 실패");
				return "forward:marketQna.do?method=modifyForm";
			}			
		}
		return "forward:marketQna.do?method=qnaList";
	}
	
	// 글 삭제하기
	@RequestMapping(params="method=delete")
	public String delete(String pageNum, String mqcode, Model model) {
		//Market_qna qna = qService.getCustomerQnaDetail(mqcode);
		int result = qService.deletMarketQna(mqcode);
		if(result == SUCCESS) {
			model.addAttribute("resultMsg", "Q&A 문의 삭제 성공");
			return "forward:marketQna.do?method=qnaList";
		} else {
			model.addAttribute("resultMsg", "Q&A 문의 삭제 실패");
			return "forward:marketQna.do?method=modifyForm";
		}
	}

}
