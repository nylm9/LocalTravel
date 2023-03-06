package com.localtravel.dto;

import lombok.Data;

@Data
public class TRInputScheduleDto {
	// 열차 스케줄 조회시 사용됩니다.
	private String depPlaceId;
	private String arrPlaceId;
	private String depPlandTime;
	public String getDepPlaceId() {
		return depPlaceId;
	}
	public void setDepPlaceId(String depPlaceId) {
		this.depPlaceId = depPlaceId;
	}
	public String getArrPlaceId() {
		return arrPlaceId;
	}
	public void setArrPlaceId(String arrPlaceId) {
		this.arrPlaceId = arrPlaceId;
	}
	public String getDepPlandTime() {
		return depPlandTime;
	}
	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	
	
}
