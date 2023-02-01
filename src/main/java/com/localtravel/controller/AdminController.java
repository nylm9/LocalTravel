package com.localtravel.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localtravel.dto.EnjoyDto;
import com.localtravel.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adsvc;
	
	
	
	
	@RequestMapping(value="insertEnjoyData")
	public ModelAndView insertEnjoyData(EnjoyDto enjoy, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("Admin_놀거리 등록 기능 호출");
		System.out.println(enjoy);
		int insertEResult = adsvc.insertEData(enjoy);
		if(insertEResult > 0) {
			System.out.println("놀거리 등록 성공");
			ra.addFlashAttribute("Msg", "놀거리 등록에 성공하였습니다.");
			
			mav.setViewName("admin/AdminPage");
		} else {
			System.out.println("놀거리 등록 실패");
			ra.addFlashAttribute("Msg", "놀거리 등록에 실패하였습니다.");
			mav.setViewName("admin/AdminPage");
		}
		return mav;
 	}
	
	@RequestMapping(value="enjoyNameCheck")
	public @ResponseBody String enjoyNameCheck(String inputEname, String inputEaddr) {
		System.out.println("Ajax_놀거리 이름 중복체크");
		System.out.println("입력한 놀거리 이름 : " + inputEname);
		System.out.println("입력한 놀거리 이름 : " + inputEaddr);
		//1. 중복 확인 기능 호출
		String enjoyCheckResult = adsvc.enjoyCheck(inputEname, inputEaddr);
		//2. 중복확인 결과값 리턴
		return enjoyCheckResult;
	}
	
	@RequestMapping(value="AdminPage")
	public ModelAndView AdminPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("관리자 페이지 이동");
		// Enjoy 데이터 모두 조회
		ArrayList<EnjoyDto> enjoyList = adsvc.getEnjoyData();
		mav.addObject("enjoyList",enjoyList);
		mav.setViewName("admin/AdminPage");
		return mav;
	}
  	
	
	
}
