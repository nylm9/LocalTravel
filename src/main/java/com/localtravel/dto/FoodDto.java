package com.localtravel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FoodDto {
	private String fcode; //식당코드
	private String fname; //식당이름
	private int flcode;  //식당지역코드
	private String faddr;  //식당주소
	private String ftell; //식당전화번호
	private String frepute; //식당평점
	private String fexplain; //식당상세정보 
	private int fthcode;  //식당음식테마코드
	private MultipartFile ffile; // 업로드한 사진파일
	private String fpicture; // 업로드한 사진코드
	

}
