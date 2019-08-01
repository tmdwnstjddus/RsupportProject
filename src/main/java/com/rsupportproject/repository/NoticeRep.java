package com.rsupportproject.repository;

import java.util.List;

import com.rsupportproject.vo.Criteria;
import com.rsupportproject.vo.Notice;

public interface NoticeRep {

	List<Notice> listView(Criteria cri);
	
	int writeNotice(Notice notice);

	Notice detailView(int uploadNo);

	void delete(int uploadNo);

	void updateNotice(Notice notice);
	
	int readCount(int uplaodNo);

	int listCount();

	


}
