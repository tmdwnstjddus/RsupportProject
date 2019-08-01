package com.rsupportproject.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.rsupportproject.mapper.NoticeMapper;
import com.rsupportproject.vo.Criteria;
import com.rsupportproject.vo.Notice;

public class NoticeRepImpl implements NoticeRep{
	
	private SqlSessionTemplate sessionTemplate;
	   
    public SqlSessionTemplate getSessionTemplate() {
    	return sessionTemplate;
    }

   public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
	   this.sessionTemplate = sessionTemplate;
    }

	private NoticeMapper noticeMapper;
	public NoticeMapper getNoticeMapper() {
		return noticeMapper;
	}
	public void setNoticeMapper(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}
	
	@Override
	public List<Notice> listView(Criteria cri) {
		
		List<Notice> notice = noticeMapper.listView(cri);
	      
        return notice;
	}

	@Override
	public int writeNotice(Notice notice) {

		noticeMapper.writeNotice(notice);

		return notice.getUploadNo();

	}

	@Override
	public Notice detailView(int uploadNo) {
		
		Notice notice = noticeMapper.detailView(uploadNo);
		
		return notice;
	}

	@Override
	public void delete(int uploadNo) {
		
		noticeMapper.delete(uploadNo);
		
	}


	@Override
	public int readCount(int uplaodNo) {
		
		return noticeMapper.readCount(uplaodNo);
	}

	@Override
	public void updateNotice(Notice notice) {
		
		noticeMapper.updateNotice(notice);
		
	}

	@Override
	public int listCount() {

		int list = noticeMapper.listCount();
		return list;

	}



}
