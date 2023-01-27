package com.localtravel.dto;

import lombok.Data;

@Data
public class TRInputScheduleDto {
	// 열차 스케줄 조회시 사용됩니다.
	private String depPlaceId;
	private String arrPlaceId;
	private String depPlandTime;
}
