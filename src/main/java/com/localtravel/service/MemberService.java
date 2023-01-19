package com.localtravel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.localtravel.dao.MemberDao;
import com.localtravel.dto.MemberDto;

@Service
public class MemberService {
<<<<<<< HEAD

	@Autowired
	private MemberDao memdao;
	
	public int memberJoin(MemberDto member) {
		System.out.println("MemberService 회원가입 기능 호출");
		int insertResult = memdao.insertMemberJoin(member);
		return insertResult;
=======
	
	@Autowired
	private MemberDao memdao;
	
	/* 로그인 기능 서비스 */
	public MemberDto memberLogin(MemberDto member) {
		
		MemberDto memberInfo = memdao.memberLogin(member);
		
		return memberInfo;
>>>>>>> yeonwoo
	}

}
