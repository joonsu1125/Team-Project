package com.tj.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("review")
public class ReviewController {
	@RequestMapping(value="review")
	public String review() {
		return "review/review";
	}
}
