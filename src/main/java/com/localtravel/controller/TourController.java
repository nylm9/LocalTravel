package com.localtravel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.localtravel.dto.ReviewDto;
import com.localtravel.service.TourService;

@Controller
public class TourController {
	@RequestMapping(value = "/playInfo")
	public ModelAndView playInfo() {
		System.out.println("놀거리상세보기테스트");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Play/playInfo");
		return mav;
	}
	@RequestMapping(value = "/reviewForm")
	public ModelAndView reviewForm(String reencode) {
		System.out.println("리뷰페이지이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/ReviewForm");
		return mav;
	}
	@Autowired
	private HttpSession session;
	
	@Autowired
	private TourService toursvc;
	
	@RequestMapping(value = "/reviewWrite")
	public @ResponseBody String reviewWrite(ReviewDto review) {
		System.out.println("관람평등록요청");
		String loginId = (String) session.getAttribute("loginId");
		
		 if(loginId == null) { return "N_login"; }
		 
		review.setRvmid(loginId);
		System.out.println(review);

		String writeResult = toursvc.reviewWrite_svc(review);
		return writeResult;
	}

}
