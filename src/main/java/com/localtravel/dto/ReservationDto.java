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
	public String getRemid() {
		return remid;
	}
	public void setRemid(String remid) {
		this.remid = remid;
	}
	public String getRecode() {
		return recode;
	}
	public void setRecode(String recode) {
		this.recode = recode;
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
	public String getTrainno() {
		return trainno;
	}
	public void setTrainno(String trainno) {
		this.trainno = trainno;
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
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getSeatnum() {
		return seatnum;
	}
	public void setSeatnum(String seatnum) {
		this.seatnum = seatnum;
	}
	public String getTraindate() {
		return traindate;
	}
	public void setTraindate(String traindate) {
		this.traindate = traindate;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	
	
}
