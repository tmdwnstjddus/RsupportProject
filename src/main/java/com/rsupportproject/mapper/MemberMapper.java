package com.rsupportproject.mapper;

import java.util.HashMap;

import com.rsupportproject.vo.Member;

public interface MemberMapper {

	void registerMember(Member member);

	Member loginMember(HashMap<String, Object> params);

	Member idCheck(String memberId);

}
