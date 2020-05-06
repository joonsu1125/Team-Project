package com.tj.sp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.sp.dao.FavoriteDao;
import com.tj.sp.dto.Favorite;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	private FavoriteDao favoriteDao;
	@Override
	public int checkFavorite(String cid, String pcode) {
		Favorite favorite = new Favorite();
		favorite.setCid(cid);
		favorite.setPcode(pcode);
		return favoriteDao.checkFavorite(favorite);
	}

	@Override
	public int insertFavorite(String cid, String pcode) {
		Favorite favorite = new Favorite();
		favorite.setCid(cid);
		favorite.setPcode(pcode);
		return favoriteDao.insertFavorite(favorite);
	}

	@Override
	public int deleteFavorite(String cid, String pcode) {
		Favorite favorite = new Favorite();
		favorite.setCid(cid);
		favorite.setPcode(pcode);
		return favoriteDao.deleteFavorite(favorite);
	}

	@Override
	public int clickFavorite(String cid, String pcode) {
		Favorite favorite = new Favorite();
		favorite.setCid(cid);
		favorite.setPcode(pcode);
		int check = favoriteDao.checkFavorite(favorite);
		if(check==1) {
			favoriteDao.deleteFavorite(favorite);
		}else {
			favoriteDao.insertFavorite(favorite);
		}
		return favoriteDao.checkFavorite(favorite);
	}

}
