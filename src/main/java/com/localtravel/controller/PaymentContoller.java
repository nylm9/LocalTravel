package com.localtravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.localtravel.dto.TRServeDto;

@Controller
public class PaymentContoller {
	
	@RequestMapping(value = "/TestPayment")
	public ModelAndView TestPayment(TRServeDto reserveData) {
		ModelAndView mav = new ModelAndView();
		System.out.println(reserveData);
		mav.addObject("reserveData", reserveData);
		mav.setViewName("reserve/paymentPage");
		return mav;
	}
	
	/* =========== PC 결제 부분 =============================*/
	
	@RequestMapping(value = "/PCPayment")
	public ModelAndView PCPayment() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("payment/order");
		return mav;
	}
	
	
	/* =========== 모바일 결제 부분 =============================*/
	
	@RequestMapping(value = "/MobilePayment")
	public ModelAndView MobilePayment() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("payment/mobile_order");
		return mav;
	}
	
	@RequestMapping(value = "/MobilePaymentProcess")
	public ModelAndView MobilePaymentProcess() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("payment/kcp_api_trade_reg");
		return mav;
	}
	
	@RequestMapping(value = "/MobilComplete")
	public ModelAndView MobilComplete() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("payment/mobile_order_complete");
		return mav;
	}
	
	/* ========================= 결제 성공 부분 =============================== */
	
	@RequestMapping(value = "/pay_success")
	public ModelAndView pay_success() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reserve/trainReservationSuccess");
		return mav;
	}
	
	
	
	
}
