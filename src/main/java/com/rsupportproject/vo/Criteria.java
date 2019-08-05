package com.rsupportproject.vo;


public class Criteria
{
    private int page; 		//현재페이지 번호
    private int perPageNum; //한페이지당 보여줄 게시판 수
    private int rowStart;   //보여주기시작할 페이지 번호
    private int rowEnd;     //마지막으로 보여줄 페이지 번호
    
    public Criteria()
    {
        this.page = 1;
        this.perPageNum = 10;
    }
   
    public void setPage(int page)
    {
       if (page <= 0)
          {
             this.page = 1;
             return;
          }
       this.page = page;
    }
   
    public void setPerPageNum(int perPageNum)
       {
          if (perPageNum <= 0 || perPageNum > 100)
             
          {
             this.perPageNum = 10;
             return;
          }
          
          this.perPageNum = perPageNum;
    }
   
    public int getPage(){
       
       return page;
       }

   
    public int getPerPageNum(){
       
       return this.perPageNum;
    }
   
    @Override
    public String toString() {
       
     return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ""
       + ", rowStart=" +  getRowStart() + ", rowEnd=" + getRowEnd()
       + "]";
     
       }
   
    public int getRowStart() {
       rowStart = ((page - 1) * perPageNum) + 1;
       return rowStart;
    }
   
    public int getRowEnd() {
       rowEnd = rowStart + perPageNum - 1;
       return rowEnd;
    }
}