package com.tj.sp.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.sp.dto.Product_qna;
import com.tj.sp.service.Product_qnaService;
import com.tj.sp.util.Paging;

@Controller
@RequestMapping("product_qna")
public class Product_qnaController {
	@Autowired
	private Product_qnaService  product_qnaService;
	@RequestMapping(params="method=writeQnaForm")
	   public String writeQnaForm() {
	      return "product_qna/writeQnaForm";
	}
	@RequestMapping(params="method=writeQna")
	public String writeQna(Product_qna product_qna, Model model, String cid, String pcode) {
		product_qna.setCid(cid);
		product_qna.setPcode(pcode);
		System.out.println(product_qna.toString());
	   model.addAttribute("writeQnaResult",product_qnaService.writeQna(product_qna));
	   return "product_qna/writeQnaForm";
	   //return "forward:product.do?method=detailProduct";
	}
	@RequestMapping(params="method=modifyQnaForm")
	public String modifyQnaForm(Product_qna product_qna, Model model, String cid, String pcode) {
	   model.addAttribute("modifyQnaForm",product_qnaService.getQna(product_qna));
	   return "product_qna/modifyQnaForm";
	}
	@RequestMapping(params="method=modifyQna")
	public String modifyQna(Product_qna product_qna, Model model) {
	   System.out.println("수정할 데이터(컨트롤러) : "+product_qna);
	   model.addAttribute("modifyQnaResult",product_qnaService.modifyQna(product_qna));
	   return "product_qna/modifyQnaForm";
	}
	@RequestMapping(params="method=replyQnaForm")
	public String replyQnaForm(Product_qna product_qna, Model model) {
	   model.addAttribute("replyQnaForm",product_qnaService.getQna(product_qna));
	   return "product_qna/replyQnaForm";
	}
	@RequestMapping(params="method=replyQna")
	public String replyQna(Product_qna product_qna, Model model ) {
	   model.addAttribute("replyQnaResult",product_qnaService.replyQna(product_qna));
	   System.out.println(product_qnaService.replyQna(product_qna));
	   return "product_qna/replyQnaForm";
	}
	@RequestMapping(params="method=deleteQna")
	public String deleteQna(String pqcode, Model model) {
	      model.addAttribute("deleteQnaResult",product_qnaService.deleteQna(pqcode));
	   return "product_qna/modifyQnaForm";
	}
}
