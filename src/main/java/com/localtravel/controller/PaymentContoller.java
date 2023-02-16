package com.localtravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentContoller {
	
	@RequestMapping(value = "/TestPayment")
	public ModelAndView TestPayment() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reserve/paymentPage");
		return mav;
	}
	
	@RequestMapping(value = "/PCPayment")
	public ModelAndView PCPayment() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("payment/order");
		return mav;
	}
	
}
