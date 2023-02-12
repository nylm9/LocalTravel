package com.localtravel.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.localtravel.dao.MemberDao;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.MemberDto;
import com.localtravel.dto.MenuDto;

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





	public ArrayList<Map<String, String>> getmembersList(String loginId) {
		System.out.println("MemberService - 마이페이지 로그인한 아이디 정보조회");
		ArrayList<Map<String, String>> memList = memdao.selectMemberList_Rank(loginId);
		System.out.println(memList);
		return memList;
	}

	public MemberDto getmemberInfo(String loginId) {
		System.out.println("MemberService - 마이페이지 회원정보수정페이지 출력");
		MemberDto memInfo = memdao.selectfoodInfo(loginId);
		System.out.println(memInfo);
		return memInfo;
		
	}

	public int boardModify(MemberDto memberDto) {
		System.out.println("MemberService - 마이페이지 회원정보수정");
		int updateResult =memdao.updateBoard(memberDto);
//		try {
//			updateResult = memdao.updateBoard(loginId);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		return updateResult;
	}








}
