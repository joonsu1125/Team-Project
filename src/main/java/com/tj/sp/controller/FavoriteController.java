package com.tj.sp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.sp.service.FavoriteService;

@Controller
@RequestMapping("favorite")
public class FavoriteController {
	@Autowired
	private FavoriteService favoriteService;
	@RequestMapping(params="method=check", method =RequestMethod.GET)
	public String checkFavorite(String pcode, String cid, Model model) {
		model.addAttribute("check",favoriteService.checkFavorite(cid, pcode));
		return "product/favoriteBtn";
	}
	@RequestMapping(params="method=click", method =RequestMethod.GET)
	public String clickFavorite(String pcode, String cid, Model model) {
		model.addAttribute("check",favoriteService.clickFavorite(cid, pcode));
		return "product/favoriteBtn";
	}
}
