package com.localtravel.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.localtravel.dao.MemberDao;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.LikeBtnDto;
import com.localtravel.dto.LikeFoodBtnDto;
import com.localtravel.dto.MemberDto;
import com.localtravel.dto.MenuDto;
import com.localtravel.dto.ReservationDto;

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

		return updateResult;
	}


	public ArrayList<EnjoyDto> getEnjoyList(String loginId) {
		System.out.println("MemberService - 놀거리좋아요리스트출력");
		ArrayList<LikeBtnDto> likeList = memdao.selectlikeList(loginId);
		System.out.println(likeList);
		ArrayList<EnjoyDto> enjoyList = new ArrayList<EnjoyDto>();
		for(LikeBtnDto likeInfo : likeList) {
			String ecode = likeInfo.getLbcode();
			EnjoyDto enjoy = memdao.selectecodelikeList(ecode);
			enjoyList.add(enjoy);
		}
		
		
		return enjoyList;
	}


	public ArrayList<FoodDto> getFoodList(String loginId) {
		System.out.println("MemberService - 먹거리좋아요리스트출력");
		ArrayList<LikeFoodBtnDto> likeList = memdao.selectlikeFoodList(loginId);
		System.out.println(likeList);
		ArrayList<FoodDto> FoodList = new ArrayList<FoodDto>();
		for(LikeFoodBtnDto likeInfo : likeList) {
			String fcode = likeInfo.getLbfcode();
			FoodDto food = memdao.selectecodelikeFoodList(fcode);
			FoodList.add(food);
		}
		
		
		return FoodList;
	}


	public ArrayList<ReservationDto> getreservationList(String loginId) {
		System.out.println("MemberService - 예매리스트출력");
		ArrayList<ReservationDto> reservationList = memdao.selectreservationList(loginId);
		System.out.println(reservationList);
		return reservationList;
	}








}
