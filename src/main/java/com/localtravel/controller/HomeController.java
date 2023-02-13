package com.localtravel.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.localtravel.dto.BlogDto;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.service.EnjoyService;
import com.localtravel.service.TrainReserveService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	TrainReserveService treserve;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		System.out.println("메인페이지에 놀거리 출력");
		ArrayList<EnjoyDto> enList = ensvc.getenjoyList();
		ModelAndView mav = new ModelAndView();
		
		ArrayList<BlogDto> blist = ensvc.getbloglist();
		
		mav.addObject("enList", enList);
		mav.addObject("blist", blist);
		System.out.println("enList:"+enList);
		System.out.println("blist:"+blist);
		mav.setViewName("home");
		return mav;
	}
	@Autowired
	EnjoyService ensvc;
	
	@RequestMapping("/mainPage")
	public ModelAndView mainPage() {
		System.out.println("메인페이지에 놀거리 출력");
		ArrayList<EnjoyDto> enList = ensvc.getenjoyList();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("enList", enList);
		System.out.println("enList:"+enList);
		mav.setViewName("home");
		return mav;
	}
	
	
	// 예매페이지 이동 
	@RequestMapping(value="/reservePage")
	public ModelAndView reservePage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("예약페이지 이동");
		ArrayList<TRCityCodeDto> cityList = treserve.getCityList();
		System.out.println(cityList);
		mav.addObject("cityList",cityList);
		mav.setViewName("reserve/projectreserve");
		return mav;
	}
	@RequestMapping(value="/BlogWritePage")
	public ModelAndView BlogWritePage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("블로그작성페이지이동");
	
		 
		mav.setViewName("review/BlogWrite");
		return mav;
	}

	/*
	 * @Autowired private HttpSession session;
	 */
	@RequestMapping(value="/BlogWrite")
	public String BlogWrite(BlogDto bto,String bcode) {
		
		System.out.println("놀거리코드"+bcode);
		System.out.println("블로그작성");
		bto.setBcode(bcode);
		System.out.println(bto);
//		ArrayList<BlogDto> BlogList = ensvc.getBlogList(ecode);
//		System.out.println(BlogList); mav.addObject("BlogList",BlogList);
//		mav.setViewName("review/BlogWrite");
		String writeResult = ensvc.getBlogList(bto);
		return writeResult;
		
	}
	@RequestMapping(value="/BlogView")
	public ModelAndView BlogView() {
		ModelAndView mav = new ModelAndView();
		System.out.println("블로그보기페이지");
	
		 
		mav.setViewName("review/BlogView");
		return mav;
	}

 	
	
}
