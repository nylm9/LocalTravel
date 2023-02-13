package com.localtravel.dto;

public class BlogDto {
	private String bcode; //놀거리블로그 코드
	private String bcontent;//놀거리 블로그 내용
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String ecode) {
		this.bcode = ecode;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	@Override
	public String toString() {
		return "BlogDto [bcode=" + bcode + ", bcontent=" + bcontent + "]";
	}
	
	
} 
