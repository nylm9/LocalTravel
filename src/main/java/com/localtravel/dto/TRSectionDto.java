package com.localtravel.dto;

import lombok.Data;

@Data
public class TRSectionDto {
	private String allsection;  // 전체구간(이니셜로 구분)
	private String section;		// 구간
	private String nfare;		// 일반요금
	private String sfare;		// 특실요금
}
