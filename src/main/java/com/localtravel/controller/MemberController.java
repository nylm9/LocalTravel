package com.localtravel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.localtravel.dto.MemberDto;
import com.localtravel.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memsvc;
	

	@RequestMapping(value="/memberJoinForm")
	public ModelAndView MemberJoingForm() {
		ModelAndView mav = new ModelAndView();
		System.out.println("회원가입 페이지 이동 요청");
		mav.setViewName("member/memberJoinForm");
		return mav;
	}
	
	@RequestMapping(value="/memberJoin") 
		public ModelAndView MemberJoin(MemberDto member) {
		ModelAndView mav = new ModelAndView();
		System.out.println("회원가입 기능 호출");
		System.out.println(member);
		int joinResult = memsvc.memberJoin(member);
		if(joinResult > 0) {
			System.out.println("회원가입 성공");
			mav.setViewName("redirect:/");
		} else {
			System.out.println("회원가입 실패");
			mav.setViewName("redirect:/memberJoinForm");
		}
		return mav;
 	}


	/* 로그인 페이지 이동 매핑*/
	@RequestMapping(value = "/memberLoginForm")
	public ModelAndView memberLoginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberLoginForm");
		return mav;
	}
	
	/* 로그인 기능 매핑*/
	@RequestMapping(value = "/memberLogin")
	public @ResponseBody String memberLogin(MemberDto member){
		String LoginId = null;
		System.out.println(member);
		MemberDto memberInfo = memsvc.memberLogin(member);
		if(memberInfo != null) {
			//로그인 성공시
			
			LoginId = memberInfo.getMid();
			System.out.println("로그인 아이디 : " + LoginId);
		}
		
		return LoginId;
	}

}
