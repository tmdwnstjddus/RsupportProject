package com.rsupportproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rsupportproject.service.MemberService;
import com.rsupportproject.vo.Member;

@Controller
@RequestMapping(path ="/account/")
public class AccountController {
	
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	//register.jsp 이동
	@RequestMapping(path ="register", method = RequestMethod.GET)
	public String registerForm() {
		
		return "account/register";
		
	}
	
	//register 처리
	@RequestMapping(path = "register", method = RequestMethod.POST)
	public String register(Member member, String confirm) {
		
		if (!member.getPasswd().equals(confirm)) {
			return "redirect:/account/register";
		}
		
		memberService.registerMember(member);
		
		return "redirect:/account/login";
		
	}
	
	//ID Check
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(String memberId) {
	
		
		Member idCheck = memberService.idCheck(memberId);
		
		int result = 0;
		
		if(idCheck != null) {
			result = 1;
		}
		
		return result;
		
	}
	
	
	//login.jsp 이동
	@RequestMapping(path ="login", method = RequestMethod.GET)
	public String loginForm() {
		
		return "account/login";
		
	}
	
	@RequestMapping(path = "login", method = RequestMethod.POST)
	public String login(String memberId, String passwd, HttpSession session) {
		
		
		//로그인 가능 여부 확인
		Member member = memberService.loginMember(memberId, passwd);
		
		//로그인 성공 또는 실패 처리
		if (member != null) { //로그인 가능 -> 로그인 처리 : 세션에 로그인 데이터 저장
			session.setAttribute("loginuser", member); //로그인 처리
			return "redirect:/home"; 			
		} else { //로그인 실패
			return "account/login";			
		}
		
	}
	
	
	
	@RequestMapping(path = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginuser");
		return "redirect:/home";
		
	}
	
	
	
}
