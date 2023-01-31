package com.localtravel.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localtravel.dto.MemberDto;
import com.localtravel.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memsvc;
	
	@Autowired
	private HttpSession session;

	@RequestMapping(value="/memberJoinForm")
	public ModelAndView MemberJoingForm() {
		ModelAndView mav = new ModelAndView();
		System.out.println("회원가입 페이지 이동 요청");
		mav.setViewName("member/memberJoinForm");
		return mav;
	}
	
	@RequestMapping(value="/memberJoin") 
		public ModelAndView MemberJoin(MemberDto member, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("회원가입 기능 호출");
		System.out.println(member);
		int joinResult = memsvc.memberJoin(member);
		if(joinResult > 0) {
			System.out.println("회원가입 성공");
			ra.addFlashAttribute("Msg", "회원가입에 성공하였습니다.");
			mav.setViewName("redirect:/");
		} else {
			System.out.println("회원가입 실패");
			ra.addFlashAttribute("Msg", "회원가입에 실패하였습니다.");
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
	public ModelAndView memberLogin(MemberDto member, RedirectAttributes ra){
		System.out.println("로그인 기능 호출");
		ModelAndView mav = new ModelAndView();
		String LoginId = null;
		System.out.println(member);
		MemberDto memberInfo = memsvc.memberLogin(member);
		if(memberInfo != null) {
			//로그인 성공시
			LoginId = memberInfo.getMid();
			System.out.println("로그인 아이디 : " + LoginId);
			ra.addFlashAttribute("Msg", "로그인 되었습니다.");
			session.setAttribute("loginId", memberInfo.getMid());
			mav.setViewName("redirect:/");
		} else {
			System.out.println("로그인 실패");
			ra.addFlashAttribute("Msg", "아이디/비밀번호를 다시 확인해주세요.");
			mav.setViewName("member/memberLoginForm");
		}
		return mav;
	}
	
	
	
	@RequestMapping(value = "/memberIdCheck") 
	public @ResponseBody String memberIdCheck(String inputId) { //ajax를 쓸 때의 return 타입은 ModelAndView가 아님. 
		//@ResponseBody : String은 '페이지 이름'을 의미한다. 따라서 응답해주는 값을 '데이터를 주고받는 형식'으로 씀을 의미하는 어노테이션
		System.out.println("아이디 중복 체크 확인 요청");
		System.out.println("입력한 아이디 : " + inputId);
		
		//1. 아이디 중복 확인 기능 호출
		String idCheckResult = memsvc.memberIdCheck(inputId);
		//2. 중복확인 결과값 리턴
		return idCheckResult;
	}
	
	@RequestMapping(value="/memberLogout" )
	public ModelAndView memberLogout(RedirectAttributes ra) throws IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("로그아웃 요청");
		session.invalidate();
		ra.addFlashAttribute("Msg", "로그아웃 되었습니다.");
		mav.setViewName("redirect:/");
		return mav;
		
	}
	
	/* 테마 버튼을 클릭하여 ajax로 관련 정보를 조회할 때는 총 1~3개의 버튼이 눌리므로 
	 * ajax문을 1개로 써서 파라메터 3개를 전송한다. (1개만 눌릴때는 2개를 null로)
	 * null인 파라메터는 서비스 switch case같은 제어문으로 처리하거나 mapper에서 조건문을 나누어 처리! */

}
