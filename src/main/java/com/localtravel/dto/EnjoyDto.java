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
	private int ethcode; //놀거리테마코드
	private MultipartFile efile; // 업로드한 사진파일
	private String epicture; // 사진파일코드
	
}
