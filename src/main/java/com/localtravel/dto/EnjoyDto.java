package com.localtravel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EnjoyDto {
	
	private String ecode;
	private String ename;
	private int elcode;
	private String eaddr;
	private String etell;
	private String erepute;
	private String eexplain;
	private int ethcode;
	private MultipartFile efile; // 업로드한 사진파일
	private String epicture; // 사진파일코드
	
}
