package com.tj.sp.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.sp.dto.Notice;
import com.tj.sp.service.NoticeService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	private int writable=0;
	@RequestMapping(params="method=noticeList")
	public String noticeList(Model model,String pagenum) {
		Paging paging = new Paging(noticeService.totalNotice(), pagenum, 10, 5);
		model.addAttribute("paging",paging);
		model.addAttribute("noticeList",noticeService.noticeList(pagenum));
		return "notice/noticeForm";
	}
	@RequestMapping(params="method=noticeList", method=RequestMethod.POST)
	public String noticeListPost(Model model,String pagenum) {
		Paging paging = new Paging(noticeService.totalNotice(), pagenum, 10, 5);
		model.addAttribute("paging",paging);
		model.addAttribute("noticeList",noticeService.noticeList(pagenum));
		return "notice/noticeForm";
	}
	@RequestMapping(params="method=noticeWriteForm")
	public String noticeWriteForm() {
		writable = 1;
		return "notice/noticeWirteForm";
	}
	@RequestMapping(params="method=noticeWrite" ,method=RequestMethod.POST)
	public String noticeWrite(Notice notice, Model model){
		System.out.println(notice.toString());
		if(writable==1) {
			model.addAttribute("writeResult", noticeService.addNotice(notice));
			writable=0;
		}
		return "forward:notice.do?method=noticeList";
	}
	@RequestMapping(params="method=noticeDetailForm", method=RequestMethod.GET)
	public String noticeDetailForm(String ncode,Model model) {
		model.addAttribute("noticeDetail" ,noticeService.getNotice(ncode));
		return "notice/noticeDetailForm";
	}
	@RequestMapping(params="method=noticeModifyForm", method=RequestMethod.POST)
	public String noticeModifyForm(String ncode, Model model) {
		model.addAttribute("noticeModify",noticeService.getNotice(ncode));
		return "notice/noticeModifyForm";
	}
	@RequestMapping(params="method=noticeModify", method=RequestMethod.POST)
	public String noticeModify(Notice notice,Model model) {
		model.addAttribute("modifyResult", noticeService.modifyNotice(notice));
		return "forward:notice.do?method=noticeList";
	}
	@RequestMapping(params="method=noticeReplyForm")
	public String noticeReplyForm(Model model,String ncode) {
		model.addAttribute("noticeReply",noticeService.getNotice(ncode));
		return "notice/noticeReplyForm";
	}
	@RequestMapping(params="method=noticeReply", method=RequestMethod.POST)
	public String noticeReply(Model model,Notice notice, HttpSession session) {
		model.addAttribute("replyResult", noticeService.replyNotice(notice, session));
		return "forward:notice.do?method=noticeList";
	}
	@RequestMapping(params="method=noticeDelete")
	public String noticeDelete(String ncode, Model model) {
			int result = noticeService.deleteNotice(ncode);
			if(result==1) {
				model.addAttribute("deleteResult","삭제되었습니다.");
			}
			return "forward:notice.do?method=noticeList";
	}
}
