package com.localtravel.dto;

import lombok.Data;

@Data
public class MenuDto {
	private String menufcode;		// 가게코드(FK - Food_fcode)
	private String menuname1; 		// 대표메뉴1 이름
	private int menuprice1;   		// 대표메뉴1 가격
	private String menuexplain1;   // 대표메뉴1 설명
	
	private String menuname2;		// 대표메뉴2 이름
	private int menuprice2;		// 대표메뉴2 가격
	private String menuexplain2;	// 대표메뉴2 설명
	
	private String menuname3;		// 대표메뉴3 이름
	private int menuprice3;		// 대표메뉴3 가격	
	private String menuexplain3;	// 대표메뉴3 설명
	
}
