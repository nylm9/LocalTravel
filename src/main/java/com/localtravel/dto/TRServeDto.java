package com.localtravel.dto;

import lombok.Data;

@Data
public class TRServeDto {
	//depSta=서울&arrSta=부산$trainNo=103$deptime=13:10&arrtime=16:22$carNum=5$seatNum=B5
	private String depSta;
	private String arrSta;
	private String trainNo;
	private String deptime;
	private String arrtime;
	private String carNum;
	private String seatNum;
	private String reserveDate;
	private String adultCharge;
}
