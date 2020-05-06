package com.tj.sp.dao;

import com.tj.sp.dto.Favorite;

public interface FavoriteDao {
	public int checkFavorite(Favorite favorite);
	public int insertFavorite(Favorite favorite);
	public int deleteFavorite(Favorite favorite);
}
