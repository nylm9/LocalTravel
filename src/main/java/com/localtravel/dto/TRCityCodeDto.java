package com.localtravel.dto;

import lombok.Data;

@Data
public class TRCityCodeDto {
	private String citycode;
	private String cityname;
	public String getCitycode() {
		return citycode;
	}
	public void setCitycode(String citycode) {
		this.citycode = citycode;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	
	
}
