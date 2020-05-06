package com.tj.sp.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.tj.sp.dto.Notice;

public interface NoticeService {
	public int addNotice(Notice notice);
	public int replyNotice(Notice notice,HttpSession session);
	public Notice getNotice(String ncode);
	public int modifyNotice(Notice notice);
	public int deleteNotice(String ncode);
	public List<Notice> noticeList(String pagenum);
	public int totalNotice();
}
