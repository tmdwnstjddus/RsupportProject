package com.rsupportproject.vo;

import java.sql.Date;
import lombok.Data;

@Data	
public class Notice {
	
	private int uploadNo;    //번호
	private String title;    //제목
	private String content;  //내용
    private String uploader; //작성자
    private String deleted;  //삭제
    private Date regdate;	 //작성일
    private Date moddate;	 //최종수정일
    private int readCount;   //조회수
	

}
