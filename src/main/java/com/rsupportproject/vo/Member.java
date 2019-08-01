package com.rsupportproject.vo;

import lombok.Data;

@Data
public class Member {
	
	private String memberId;
	private String passwd;
	private String email;
	
	// private boolean active;		//oracle에는 boolean 타입이 없지만 char(1) 자료형으로 java의 boolean 호환 가능

}
