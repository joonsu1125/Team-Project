package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.sp.dto.Store_qna;
import com.tj.sp.service.StoreQnaService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("storeQna")
public class StoreQnaController {
	
	private static final int SUCCESS = 1;
	private static final int FAIL = 0;
	
	// 글쓰기 중복 방지
	private boolean writable = false;
	
	@Autowired
	private StoreQnaService qService;
	
	// 게시판 리스트화면 호출
	@RequestMapping(params="method=qnaList")
	public String qnaList(String pageNum, Model model, Store_qna qna) {
		// 페이징 처리
		Paging paging = new Paging(qService.totalStoreQna(), pageNum, 10, 10);
		qna.setStartrow(paging.getStartrow());
		qna.setEndrow(paging.getEndrow());
		
		//model.addAttribute("pageNum", pageNum);
		model.addAttribute("list", qService.storeQnaList(qna));
		model.addAttribute("paging", paging);
		return "storeQna/qnaList";
	}
	
	// 글쓰기 폼 호출
	@RequestMapping(params="method=writeForm")
	public String registerForm() {
		writable = true;
		return "storeQna/qnaWriteForm";
	}
	
	// 원글 쓰기
	@RequestMapping(params="method=write")
	public String write(Store_qna qna, Model model) {
		if (writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			System.out.println("write : "+qna.toString());
			int result = qService.writeStoreQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 작성 성공");
				return "forward:storeQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 작성 실패");
				return "forward:storeQna.do?method=writeForm";
			}			
		}
		return "forward:storeQna.do?method=qnaList";
	}
	
	// 답변글 달기 폼 호출
	@RequestMapping(params="method=replyForm")
	public String replyForm(String sqcode, Model model) {
		writable = true;
		model.addAttribute("sqcode", sqcode);
		model.addAttribute("detail", qService.getStoreQnaDetail(sqcode));
		return "storeQna/qnaReplyForm";
	}
	
	// 답변글 달기
	@RequestMapping(params="method=reply")
	public String reply(String pageNum, Store_qna qna, Model model) {
		if(writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			// 스텝 A진행
			qService.replyStepAStoreQna(qna);
			// 답변 달기
			int result = qService.replyStoreQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 답변작성 성공");
				return "forward:storeQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 답변작성 실패");
				return "forward:storeQna.do?method=writeForm";
			}			
		}
		return "forward:storeQna.do?method=qnaList";
	}
	
	// 글 상세보기
	@RequestMapping(params="method=detail")
	public String detail(Model model, String sqcode) {
		qService.hitupStoreQna(sqcode);
		model.addAttribute("detail", qService.getStoreQnaDetail(sqcode));
		return "storeQna/qnaDetail";
	}
	
	// 글 수정하기 폼 호출
	@RequestMapping(params="method=modifyForm")
	public String modifyForm(String pageNum, String sqcode, Model model) {
		writable = true;
		model.addAttribute("modify", qService.getStoreQnaDetail(sqcode));
		return "storeQna/qnaModifyForm";
	}
	
	// 글 수정하기
	@RequestMapping(params="method=modify")
	public String modify(String pageNum, Store_qna qna, Model model) {
		if (writable) {
			// 글쓰기 중복 방지 설정
			writable = false;
			int result = qService.modifyStoreQna(qna);
			if(result == SUCCESS) {
				model.addAttribute("resultMsg", "Q&A 문의 수정 성공");
				return "forward:storeQna.do?method=qnaList";
			} else {
				model.addAttribute("resultMsg", "Q&A 문의 수정 실패");
				return "forward:storeQna.do?method=modifyForm";
			}			
		}
		return "forward:storeQna.do?method=qnaList";
	}
	
	// 글 삭제하기
	@RequestMapping(params="method=delete")
	public String delete(String pageNum, String sqcode, Model model) {
		//Store_qna qna = qService.getCustomerQnaDetail(sqcode);
		int result = qService.deletStoreQna(sqcode);
		if(result == SUCCESS) {
			model.addAttribute("resultMsg", "Q&A 문의 삭제 성공");
			return "forward:storeQna.do?method=qnaList";
		} else {
			model.addAttribute("resultMsg", "Q&A 문의 삭제 실패");
			return "forward:storeQna.do?method=modifyForm";
		}
	}

}
