package com.localtravel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EnjoyDto {
	
	private String ecode; //놀거리코드
	private String ename; //놀거리이름
	private int elcode; //놀거리지역코드
	private String eaddr; //놀거리주소
	private String etell; //놀거리전화번호
	private String erepute; //놀거리평점
	private String eexplain;  //놀거리설명
	private String ethcode; //놀거리테마코드
	private MultipartFile efile; // 업로드한 사진파일
	private String epicture; // 사진파일코드
	public String getEcode() {
		return ecode;
	}
	public void setEcode(String ecode) {
		this.ecode = ecode;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getElcode() {
		return elcode;
	}
	public void setElcode(int elcode) {
		this.elcode = elcode;
	}
	public String getEaddr() {
		return eaddr;
	}
	public void setEaddr(String eaddr) {
		this.eaddr = eaddr;
	}
	public String getEtell() {
		return etell;
	}
	public void setEtell(String etell) {
		this.etell = etell;
	}
	public String getErepute() {
		return erepute;
	}
	public void setErepute(String erepute) {
		this.erepute = erepute;
	}
	public String getEexplain() {
		return eexplain;
	}
	public void setEexplain(String eexplain) {
		this.eexplain = eexplain;
	}
	public String getEthcode() {
		return ethcode;
	}
	public void setEthcode(String ethcode) {
		this.ethcode = ethcode;
	}
	public MultipartFile getEfile() {
		return efile;
	}
	public void setEfile(MultipartFile efile) {
		this.efile = efile;
	}
	public String getEpicture() {
		return epicture;
	}
	public void setEpicture(String epicture) {
		this.epicture = epicture;
	}

	
}
