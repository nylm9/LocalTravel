package com.localtravel.dto;

import lombok.Data;

@Data
public class TRRouteDto {
	private String routecode;  		// KTX노선(이니셜로 구분)
	private String routekr;			// KTX노선(한글로 표기)
	private String depsta;			// 출발역
	private String arrsta;			// 도착역
	private String normalfare;		// 일반요금
	private String specialfare;		// 특실요금
}
