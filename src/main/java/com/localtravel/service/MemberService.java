package com.localtravel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.localtravel.dao.MemberDao;
import com.localtravel.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memdao;
	
	/* 로그인 기능 서비스 */
	public MemberDto memberLogin(MemberDto member) {
		
		MemberDto memberInfo = memdao.memberLogin(member);
		
		return memberInfo;
	}

}
