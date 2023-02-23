package com.localtravel.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.localtravel.dto.MemberDto;
import com.localtravel.dto.ReservationDto;
import com.localtravel.dto.TRServeDto;
import com.localtravel.service.TrainReserveService;

@Controller
public class PaymentContoller {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	TrainReserveService trsvc;
	
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
		String loginId = (String)session.getAttribute("loginId");
		MemberDto memInfo = trsvc.getMemberInfo(loginId);
		mav.addObject("memInfo", memInfo);
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
	
	@RequestMapping(value = "/reservationAdd")
	public ModelAndView reservationAdd(TRServeDto reserveData) {
		ModelAndView mav = new ModelAndView();
		System.out.println(reserveData);
		
		ReservationDto reList = trsvc.reservationAdd(reserveData);
		
		String seatNumStr = reserveData.getSeatNum();
		String[] seatcount = seatNumStr.split(",");
		reList.setCharge(Integer.toString(Integer.parseInt(reserveData.getAdultCharge()) * seatcount.length));
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년MM월dd일 HH:mm");
        String formattedDateTime = now.format(formatter);
        reList.setRedate(formattedDateTime);
		mav.addObject("reList", reList);
		mav.setViewName("reserve/reservationSuccessPage");
		return mav;
	}
	
	
	
}
