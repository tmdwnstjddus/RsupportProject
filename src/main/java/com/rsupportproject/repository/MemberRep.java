package com.rsupportproject.repository;

import com.rsupportproject.vo.Member;

public interface MemberRep {
	
	void registerMember(Member member);
	
	Member loginMember(String memberId, String passwd);

	Member idCheck(String memberId);

}
