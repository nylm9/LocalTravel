package com.localtravel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.localtravel.service.TrainService;

@Controller
public class TrainController {
	
	@Autowired
	TrainService trsvc;
	
	// 열차-도시코드 가져오기
	@RequestMapping(value ="/getCityCodeInfo")
	public ModelAndView getCityCodeInfo() throws Exception {
		System.out.println("TrainController - 열차 도시코드 가져오기");
		
		int insertReult = trsvc.getCityCodeInfo();
		
		return null;
	}
	
	// 열차 - 역코드 가져오기
	@RequestMapping(value ="/getStationInfo")
	public ModelAndView getStationInfo() throws Exception {
		System.out.println("TrainController - 열차 역코드 가져오기");
		
		int insertReult = trsvc.getStaionCodeInfo();
		
		return null;
	}

}
