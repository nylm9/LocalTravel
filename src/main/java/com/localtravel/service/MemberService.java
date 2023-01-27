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
	
	
	/* 로그인 기능 서비스 */
	public MemberDto memberLogin(MemberDto member) {
		
		MemberDto memberInfo = memdao.memberLogin(member);
		
		return memberInfo;
	}


	//아이디 중복확인 기능 
	public String memberIdCheck(String inputId) {
		System.out.println("MemberService memberIdCheck() 호출");
		String idCheckResult = "OK";
		//아이디 확인 
		String MemberId = memdao.idCheck(inputId);
		
		if(MemberId != null) {
			idCheckResult = "NO";
		}
		return idCheckResult;
	}

}
