package com.localtravel.dto;

import lombok.Data;

@Data
public class TRSeatDto {
	private String car;
	private String nscode;
	private String seatnum;
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getNscode() {
		return nscode;
	}
	public void setNscode(String nscode) {
		this.nscode = nscode;
	}
	public String getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(String seatnum) {
		this.seatnum = seatnum;
	}
	
	
	
}
