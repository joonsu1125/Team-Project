package com.tj.sp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Favorite;
@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int checkFavorite(Favorite favorite) {
		return sessionTemplate.selectOne("checkFavorite", favorite);
	}

	@Override
	public int insertFavorite(Favorite favorite) {
		return sessionTemplate.insert("insertFavorite",favorite);
	}

	@Override
	public int deleteFavorite(Favorite favorite) {
		return sessionTemplate.delete("deleteFavorite",favorite);
	}

}
