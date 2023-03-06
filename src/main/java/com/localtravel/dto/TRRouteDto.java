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
	public String getRoutecode() {
		return routecode;
	}
	public void setRoutecode(String routecode) {
		this.routecode = routecode;
	}
	public String getRoutekr() {
		return routekr;
	}
	public void setRoutekr(String routekr) {
		this.routekr = routekr;
	}
	public String getDepsta() {
		return depsta;
	}
	public void setDepsta(String depsta) {
		this.depsta = depsta;
	}
	public String getArrsta() {
		return arrsta;
	}
	public void setArrsta(String arrsta) {
		this.arrsta = arrsta;
	}
	public String getNormalfare() {
		return normalfare;
	}
	public void setNormalfare(String normalfare) {
		this.normalfare = normalfare;
	}
	public String getSpecialfare() {
		return specialfare;
	}
	public void setSpecialfare(String specialfare) {
		this.specialfare = specialfare;
	}
	
	
}
