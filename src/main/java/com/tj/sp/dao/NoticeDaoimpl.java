package com.tj.sp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.sp.dto.Notice;

@Repository
public class NoticeDaoimpl implements NoticeDao{
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int addNotice(Notice notice) {
		return sessionTemplate.insert("addNotice",notice);
	}

	@Override
	public int replyNotice(Notice notice) {
		return sessionTemplate.insert("replyNotice",notice);
	}
	@Override
	public void noticeHitUp(String ncode) {
		sessionTemplate.update("noticeHitUp",ncode);
	}
	@Override
	public Notice getNotice(String ncode) {
		return sessionTemplate.selectOne("getNotice",ncode);
	}
	@Override
	public void indentNotice(Notice notice) {
		sessionTemplate.update("indentNotice",notice);
	}
	@Override
	public int modifyNotice(Notice notice) {
		return sessionTemplate.update("modifyNotice",notice);
	}

	@Override
	public int deleteNotice(String ncode) {
		return sessionTemplate.delete("deleteNotice",ncode);
	}
	@Override
	public List<Notice> noticeList(Notice notice) {
		return sessionTemplate.selectList("noticeList",notice);
	}
	@Override
	public int totalNotice() {
		return sessionTemplate.selectOne("totalNotice");
	}
}
