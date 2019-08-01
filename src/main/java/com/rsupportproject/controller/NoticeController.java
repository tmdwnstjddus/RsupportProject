package com.rsupportproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsupportproject.service.NoticeService;
import com.rsupportproject.vo.Criteria;
import com.rsupportproject.vo.Notice;
import com.rsupportproject.vo.PageMaker;


@Controller
@RequestMapping(path ="/upload/")
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(path = "/notice", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) {
		
		    
		//데이터베이스에서 자료 목록 조회
		List<Notice> notice = noticeService.listView(cri);
		
		//조회 결과를 request 객체에 저장 (JSP에서 사용할 수 있도록)
		model.addAttribute("notice", notice);
		
		PageMaker PageMaker = new PageMaker();
	    PageMaker.setCri(cri);
	    PageMaker.setTotalCount(noticeService.listCount());
	    model.addAttribute("PageMaker", PageMaker);
		
		return "upload/notice"; 
	}
	
	//write form 으로 이동
	@RequestMapping(path = "/write", method = RequestMethod.GET)
	public String writeForm() {
		
		return "upload/write"; 
	}
	
	@RequestMapping(path = "/write", method = RequestMethod.POST)
	public String write(HttpServletRequest req, Notice notice) {
		
		noticeService.writeNotice(notice);
				
		return "redirect:notice";
	
	}
	
	@RequestMapping(path = "/detail/{uploadNo}", method = RequestMethod.GET)
	public String detail(@PathVariable int uploadNo, Model model) {

		Notice notice = noticeService.detailView(uploadNo);
		noticeService.readCount(uploadNo);
		
		if (notice == null) { //uploadno가 유효하지 않은 경우 (데이터베이스에 없는 번호인 경우)
			return "redirect:list";
		}		
		
		model.addAttribute("notice", notice);
		
		return "upload/detail"; // "/WEB-INF/views/" + upload/detail + ".jsp"
	}
	

	@RequestMapping(path = "/delete/{uploadNo}", method = RequestMethod.GET)
	public String delete(@PathVariable int uploadNo) {

		noticeService.delete(uploadNo);
		
		return "redirect:/upload/notice";
	}

	
	@RequestMapping(path = "/update/{uploadNo}", method = RequestMethod.GET)
	public String update(@PathVariable int uploadNo, Model model) {

		Notice notice = noticeService.detailView(uploadNo);
		if (notice == null) { 
			return "redirect:list";
		}		
		
		model.addAttribute("notice", notice);

		return "upload/update";
	}
	
	@RequestMapping(path = "/update", method = RequestMethod.POST)
	public String updateForm(HttpServletRequest req, Notice notice) {
		
		noticeService.updateNotice(notice);
				
		return "redirect:/upload/detail/" + notice.getUploadNo();
	}   	


}
