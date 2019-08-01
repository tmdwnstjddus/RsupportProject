package com.rsupportproject.service;

import java.util.List;

import com.rsupportproject.repository.NoticeRep;
import com.rsupportproject.vo.Criteria;
import com.rsupportproject.vo.Notice;


public class NoticeServiceImpl implements NoticeService {
	
	private NoticeRep noticeRep;	
	public NoticeRep getNoticeRep() {
		return noticeRep;
	}
	public void setNoticeRep(NoticeRep noticeRep) {
		this.noticeRep = noticeRep;
	}

	@Override
	public List<Notice> listView(Criteria cri) {
		
		return noticeRep.listView(cri);
	}
	
	@Override
	public int writeNotice(Notice notice) {
		
		int newNotice = noticeRep.writeNotice(notice);
		return newNotice;
		
	}
	@Override
	public Notice detailView(int uploadNo) {
		
		Notice notice = noticeRep.detailView(uploadNo);
		return notice;
	}
	
	@Override
	public void delete(int uploadNo) {
		
		noticeRep.delete(uploadNo);
		
	}
	@Override
	public int readCount(int uplaodNo) {
		
		return noticeRep.readCount(uplaodNo);
	}
	
	@Override
	public void updateNotice(Notice notice) {
		
		noticeRep.updateNotice(notice);	
	}
	
	@Override
	public int listCount() {
		return noticeRep.listCount();
	}
	
}
