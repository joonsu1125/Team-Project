package com.tj.sp.service;

public interface FavoriteService {
	public int checkFavorite(String cid, String pcode);
	public int insertFavorite(String cid, String pcode);
	public int deleteFavorite(String cid, String pcode);
	public int clickFavorite(String cid, String pcode);
}
