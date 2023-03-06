package com.localtravel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FoodDto {
	private String fcode; //식당코드
	private String fname; //식당이름
	private String f1ex; // 식당한줄소개
	private int flcode;  //식당지역코드
	private String faddr;  //식당주소
	private String ftell; //식당전화번호
	private String frepute; //식당평점
	private String fexplain; //식당상세정보 
	private String fthcode;  //식당음식테마코드
	private MultipartFile ffile; // 업로드한 사진파일
	private String fpicture; // 업로드한 사진코드
	public String getFcode() {
		return fcode;
	}
	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getF1ex() {
		return f1ex;
	}
	public void setF1ex(String f1ex) {
		this.f1ex = f1ex;
	}
	public int getFlcode() {
		return flcode;
	}
	public void setFlcode(int flcode) {
		this.flcode = flcode;
	}
	public String getFaddr() {
		return faddr;
	}
	public void setFaddr(String faddr) {
		this.faddr = faddr;
	}
	public String getFtell() {
		return ftell;
	}
	public void setFtell(String ftell) {
		this.ftell = ftell;
	}
	public String getFrepute() {
		return frepute;
	}
	public void setFrepute(String frepute) {
		this.frepute = frepute;
	}
	public String getFexplain() {
		return fexplain;
	}
	public void setFexplain(String fexplain) {
		this.fexplain = fexplain;
	}
	public String getFthcode() {
		return fthcode;
	}
	public void setFthcode(String fthcode) {
		this.fthcode = fthcode;
	}
	public MultipartFile getFfile() {
		return ffile;
	}
	public void setFfile(MultipartFile ffile) {
		this.ffile = ffile;
	}
	public String getFpicture() {
		return fpicture;
	}
	public void setFpicture(String fpicture) {
		this.fpicture = fpicture;
	}
	
	
}
