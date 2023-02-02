package com.localtravel.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.ReviewDto;
import com.localtravel.service.EnjoyService;
import com.localtravel.service.TourService;


@Controller
public class TourController {
	
	@Autowired
	private EnjoyService ensvc;
	
	@RequestMapping(value = "/playInfo")
	public ModelAndView playInfo() {
		System.out.println("놀거리상세보기");
		String ecode = "E001";
		System.out.println("놀거리코드:"+ecode);
		ModelAndView mav = new ModelAndView();
		
		        //놀거리상세정보조회
				EnjoyDto enInfo = ensvc.getenjoyInfo(ecode);
				mav.addObject("enInfo",enInfo);
				//리뷰목록조회
				ArrayList<Map<String,String>> reviewList = ensvc.getReviewList(ecode);
				mav.addObject("reviewList",reviewList);
				
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

	@RequestMapping(value="enjoyPage")
	public String enjoyPage() {
		System.out.println("놀거리 페이지 이동 요청");
		return "Play/projectPlay";
	}
	
}
