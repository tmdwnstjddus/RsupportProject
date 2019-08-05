package com.rsupportproject.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

    private int totalCount;	//게시물 총 갯수
    private int startPage; 	//현재 페이지의 시작 번호
    private int endPage;   	//현제 페이지의 끝 번호
    private boolean prev;  	//이전 페이지 존재여부
    private boolean next;  	//다음 페이지 존재여부
 
    private int displayPageNum = 5; //하단 페이지 번호갯수

    private Criteria cri;
    
    public void setCri(Criteria cri) {
    	this.cri = cri;
    }

    public void setTotalCount(int totalCount) {
    	this.totalCount = totalCount;
    	calcData();
    }

    public int getTotalCount() {
    	return totalCount;
    }

    public int getStartPage() {
    	return startPage;
    }

    public int getEndPage() {
    	return endPage;
    }

    public boolean isPrev() {
    	return prev;
    }

    public boolean isNext() {
    	return next;
    }

    public int getDisplayPageNum() {
    	return displayPageNum;
    }

    public Criteria getCri() {
    	return cri;
    }
    
    private void calcData() {
    	
    	//끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수
	    endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
	    
	    //시작 페이지 번호 = (끝 페이지 번호 - 화면에 보여질 페이지 번호의 갯수) + 1
	    startPage = (endPage - displayPageNum) + 1;
	    
	    //마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 갯수
	    int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
	    if (endPage > tempEndPage)
	    {
	    	endPage = tempEndPage;
	    }
	    prev = startPage == 1 ? false : true;
	    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    }
     

    //page uri 생성
    public String makeQuery(int page){
       
	   UriComponents uriComponents =
         UriComponentsBuilder.newInstance()
         .queryParam("page", page)
         .queryParam("perPageNum", cri.getPerPageNum())
         .build();
      
	return uriComponents.toUriString();
  }
}