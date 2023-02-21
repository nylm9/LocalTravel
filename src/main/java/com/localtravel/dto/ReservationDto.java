package com.localtravel.dto;

import lombok.Data;

@Data
public class ReservationDto {
	private String remid;
	private String recode;
	private String depsta;
	private String arrsta;
	private String trainno;
	private String deptime;
	private String arrtime;
	private String carnum;
	private String seatnum;
	private String traindate;
	private String redate;
	private String charge;
}
