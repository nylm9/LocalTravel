package com.localtravel.dto;

import lombok.Data;

@Data
public class FoodDto {
	private String fcode;
	private String fname;
	private int flcode;
	private String faddr;
	private int ftell;
	private int frepute;
	private String fexplain;
	private int fthcode;
	/* 사진 업로드 할 필드도 추가할 예정. */

}
