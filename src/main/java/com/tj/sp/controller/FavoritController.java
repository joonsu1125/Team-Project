package com.tj.sp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FavoritController {
	@RequestMapping(params="method=favoritList")
	public String favoritList() {
		return "favorit/favoritList";
	}
	
}
