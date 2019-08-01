package com.rsupportproject.service;

import java.util.List;

import com.rsupportproject.vo.Criteria;
import com.rsupportproject.vo.Notice;

public interface NoticeService {

	List<Notice> listView(Criteria cri);

	int writeNotice(Notice notice);

	Notice detailView(int uploadNo);

	void delete(int uploadNo);

	void updateNotice(Notice notice);

	int readCount(int uploadNo);

	int listCount();

}
