package com.localtravel.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.FoodReviewDto;
import com.localtravel.dto.LikeBtnDto;
import com.localtravel.dto.MenuDto;
import com.localtravel.dto.ReviewDto;
import com.localtravel.service.EnjoyService;
import com.localtravel.service.TourService;


@Controller
public class TourController {
	
	@Autowired
	private EnjoyService ensvc;
	
	//놀거리
	@RequestMapping(value="/enjoyPage")
	public ModelAndView enjoyPage() {
		System.out.println("놀거리 페이지 이동 요청");
		
		ArrayList<EnjoyDto> enList = ensvc.getenjoyList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("enList", enList);
		mav.setViewName("Play/projectPlay");
		return mav;
	}
	
	@RequestMapping(value = "/playInfo")
	public ModelAndView playInfo(String ecode) {
		System.out.println("놀거리상세보기");
//		String ecode = "E001";
		System.out.println("놀거리코드:"+ecode);
		ModelAndView mav = new ModelAndView();
		
		        //놀거리상세정보조회
				EnjoyDto enInfo = ensvc.getenjoyInfo(ecode);
				mav.addObject("enInfo",enInfo);
				//리뷰목록조회
				ArrayList<Map<String,String>> reviewList = ensvc.getReviewList(ecode);
				mav.addObject("reviewList",reviewList);
				
				//좋아요버튼
//				LikeBtnDto lelike = ensvc.getenjoylike(ecode);
//				mav.addObject("lelike",lelike);
//				String writeResult = ensvc.getenjoylike(lelike);
//				mav.addObject("writeResult",writeResult);
				
		mav.setViewName("Play/playInfo");
		return mav;
	}
	@RequestMapping(value = "/reviewForm")
	public ModelAndView reviewForm(String reencode) {
		System.out.println("리뷰페이지이동");
		System.out.println(reencode);
		
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
	
	//먹거리
	@RequestMapping(value = "/foodPage")
	public ModelAndView foodPage() {
		System.out.println("먹거리페이지이동");
		
		ArrayList<FoodDto> fdList = ensvc.getfoodList();
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("fdList", fdList);
		mav.setViewName("Play/foodPage");
		return mav;
	}
	
	@RequestMapping(value = "/foodInfo")
	public ModelAndView foodInfo(String fcode) {
		System.out.println("먹거리 상세보기");
		
		System.out.println("먹거리코드:"+fcode);
		
		ModelAndView mav = new ModelAndView();
		
		        //먹거리상세정보조회
				FoodDto fdInfo = ensvc.getfoodInfo(fcode);
				mav.addObject("fdInfo",fdInfo);
				
				  //리뷰목록조회 
					ArrayList<Map<String,String>> fdreviewList =ensvc.getfoodReviewList(fcode); 
					mav.addObject("fdreviewList",fdreviewList);
					System.out.println("리뷰목록"+fdreviewList);
					
				  //메뉴목록조회
				  ArrayList<MenuDto> mnList = ensvc.getMenuList(fcode);
				  mav.addObject("mnList", mnList);
				  System.out.println("메뉴목록"+mnList);
				 
				 
				
		mav.setViewName("Play/foodInfo");
		return mav;
}
	@RequestMapping(value = "/fdreviewForm")
	public ModelAndView fdreviewForm(String refdcode) {
		System.out.println("먹거리 리뷰페이지이동");
		System.out.println(refdcode);
		String rvfdthcode ="11111";
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/FoodReviewForm");
		return mav;
	}

	
	@RequestMapping(value = "/fdreviewWrite")
	public @ResponseBody String fdreviewWrite(FoodReviewDto fdreview) {
		System.out.println("먹거리관람평등록요청");
		String loginId = (String) session.getAttribute("loginId");
		
		 if(loginId == null) { return "N_login"; }
		 
		fdreview.setRvmid(loginId);
		
		System.out.println(fdreview);

		String fdwriteResult = toursvc.fdreviewWrite_svc(fdreview);
		return fdwriteResult;
	}
	
	
	
	@RequestMapping(value = "/enjoyInfo")
	public ModelAndView enjoyInfo(String ecode) {
		System.out.println("메인페이지에서 놀거리상세보기로 넘기기");
		//		String ecode = "E001";
		System.out.println("놀거리코드:"+ecode);
		ModelAndView mav = new ModelAndView();

		//놀거리상세정보조회
		EnjoyDto enInfo = toursvc.enjoyInfo_svc(ecode);
		mav.addObject("enInfo",enInfo);

		mav.setViewName("Play/playInfo");
		return mav;
	}
	
	@RequestMapping(value="/getEnjoyResult")
	public @ResponseBody String getEnjoyResult(String thcode, String procode) {
		System.out.println("Ajax_놀거리 정보 조회");
		System.out.println("thcode : " + thcode);
		System.out.println("procode : " + procode);
		
		ArrayList<EnjoyDto> searchEnjoyList = toursvc.getSearchEnjoyList(thcode,procode );
		
		return new Gson().toJson(searchEnjoyList);
		
	}
	
	
	@RequestMapping(value="/readyGetEnjoyList")
	public @ResponseBody String readyGetEnjoyList() {
		ArrayList<EnjoyDto> allEnjoyList = toursvc.getenjoyList();
		return new Gson().toJson(allEnjoyList);
	}
	
	@RequestMapping(value="/getFoodResult")
	public @ResponseBody String getFoodResult(String fthcode, String procode) {
		System.out.println("fthcode : " + fthcode);
		System.out.println("procode : " + procode);
		ArrayList<FoodDto> searchFoodList = toursvc.getFoodList(fthcode, procode);
		return new Gson().toJson(searchFoodList);
	}
	
	@RequestMapping(value="/readyGetAllEnjoyList")
	public @ResponseBody String readyGetAllEnjoyList() {
		ArrayList<FoodDto> allFoodList = toursvc.getAllFoodList();
		return new Gson().toJson(allFoodList);
	}
	

}
