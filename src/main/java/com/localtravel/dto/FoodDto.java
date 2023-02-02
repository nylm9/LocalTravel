package com.localtravel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FoodDto {
	private String fcode;
	private String fname;
	private int flcode;
	private String faddr;
	private String ftell;
	private String frepute;
	private String fexplain;
	private int fthcode;
	private MultipartFile ffile; // 업로드한 사진파일
	private String fpicture; // 업로드한 사진코드
	

}
