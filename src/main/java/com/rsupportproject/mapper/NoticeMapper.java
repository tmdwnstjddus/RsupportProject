package com.rsupportproject.mapper;

import java.util.List;

import com.rsupportproject.vo.Criteria;
import com.rsupportproject.vo.Notice;

public interface NoticeMapper {

	List<Notice> listView(Criteria cri);

	void writeNotice(Notice notice);

	Notice detailView(int uploadNo);
	
	void delete(int uploadNo);

	int readCount(int uplaodNo);

	void updateNotice(Notice notice);

	int listCount();

}
