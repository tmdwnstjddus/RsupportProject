package com.rsupportproject.repository;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.rsupportproject.mapper.MemberMapper;
import com.rsupportproject.vo.Member;

public class MemberRepImpl implements MemberRep{

	private SqlSessionTemplate sessionTemplate;
	   
    public SqlSessionTemplate getSessionTemplate() {
    	return sessionTemplate;
    }

   public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
	   this.sessionTemplate = sessionTemplate;
    }

	private MemberMapper memberMapper;
	public MemberMapper getMemberMapper() {
		return memberMapper;
	}
	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	   
	@Override
	public void registerMember(Member member) {
		
		memberMapper.registerMember(member);
		
	}

	@Override
	public Member loginMember(String memberId, String passwd) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("passwd", passwd);
				
		Member member = memberMapper.loginMember(params);
		
		return member;
	}

	@Override
	public Member idCheck(String memberId) {
		
		return memberMapper.idCheck(memberId);
		
	}

}
