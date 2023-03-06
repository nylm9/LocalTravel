package com.localtravel.dto;

import lombok.Data;

@Data
public class TRServeDto {
	private String recode;
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
	public String getRecode() {
		return recode;
	}
	public void setRecode(String recode) {
		this.recode = recode;
	}
	public String getDepSta() {
		return depSta;
	}
	public void setDepSta(String depSta) {
		this.depSta = depSta;
	}
	public String getArrSta() {
		return arrSta;
	}
	public void setArrSta(String arrSta) {
		this.arrSta = arrSta;
	}
	public String getTrainNo() {
		return trainNo;
	}
	public void setTrainNo(String trainNo) {
		this.trainNo = trainNo;
	}
	public String getDeptime() {
		return deptime;
	}
	public void setDeptime(String deptime) {
		this.deptime = deptime;
	}
	public String getArrtime() {
		return arrtime;
	}
	public void setArrtime(String arrtime) {
		this.arrtime = arrtime;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public String getAdultCharge() {
		return adultCharge;
	}
	public void setAdultCharge(String adultCharge) {
		this.adultCharge = adultCharge;
	}
	
}
