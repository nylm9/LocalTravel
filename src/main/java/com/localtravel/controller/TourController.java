package com.localtravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourController {

	@RequestMapping(value="enjoyPage")
	public String enjoyPage() {
		System.out.println("놀거리 페이지 이동 요청");
		return "Play/projectPlay";
	}
	
}
