package com.rsupportproject.service;

import com.rsupportproject.common.Util;
import com.rsupportproject.repository.MemberRep;
import com.rsupportproject.vo.Member;

public class MemberServiceImpl implements MemberService{

	private MemberRep memberRep;	
	public MemberRep getMemberRep() {
		return memberRep;
	}
	public void setMemberRep(MemberRep memberRep) {
		this.memberRep = memberRep;
	}
	
	@Override
	public void registerMember(Member member) {
		
		String passwd = Util.getHashedString(member.getPasswd(), "SHA-256"); //패스워드 암호화 (복원불가능)
		member.setPasswd(passwd);
		
		memberRep.registerMember(member);
	}

	@Override
	public Member loginMember(String memberId, String passwd) {
		
		passwd = Util.getHashedString(passwd, "SHA-256"); //암호화
		Member member = memberRep.loginMember(memberId, passwd);

		return member;
	}
	@Override
	public Member idCheck(String memberId) {
		
		return memberRep.idCheck(memberId);
	}



}
