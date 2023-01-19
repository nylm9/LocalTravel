package com.localtravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@RequestMapping(value="/memberJoinForm")
	public ModelAndView memberJoingForm() {
		ModelAndView mav = new ModelAndView();
		System.out.println("회원가입 페이지 이동 요청");
		mav.setViewName("member/memberJoinForm");
		return mav;
	}
	
	@RequestMapping(value="/memberJoin") 
		public ModelAndView memberJoin() {
		ModelAndView mav = new ModelAndView();
		System.out.println("회원가입 기능 호출");
		
		return mav;
 	}

}
