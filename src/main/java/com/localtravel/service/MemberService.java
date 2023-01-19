package com.localtravel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.localtravel.dao.MemberDao;
import com.localtravel.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	private MemberDao memdao;
	
	public int memberJoin(MemberDto member) {
		System.out.println("MemberService 회원가입 기능 호출");
		int insertResult = memdao.insertMemberJoin(member);
		return insertResult;
	}

}
