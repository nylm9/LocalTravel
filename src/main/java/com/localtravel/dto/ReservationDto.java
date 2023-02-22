package com.localtravel.dto;

import lombok.Data;

@Data
public class ReservationDto {
	private String remid;
	private String recode; 
	private String depsta; //출발역
	private String arrsta; //도착역
	private String trainno; //열차번호
	private String deptime; //출발시간
	private String arrtime; //도착시간
	private String carnum; //열차칸(호차)
	private String seatnum; //좌석번호
	private String traindate; //출발날짜
	private String redate; //예매한 날짜
	private String charge; //금액
}
