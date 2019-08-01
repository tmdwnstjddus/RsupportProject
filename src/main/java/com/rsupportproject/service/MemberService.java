package com.rsupportproject.service;

import com.rsupportproject.vo.Member;

public interface MemberService {
	
	void registerMember(Member member);
	
	Member loginMember(String memberId, String passwd);

	Member idCheck(String memberId);
}
