package com.localtravel.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.localtravel.dto.TRCityCodeDto;
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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/mainPage")
	public String mainPage() {
		return "home";
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

 	
	
}
