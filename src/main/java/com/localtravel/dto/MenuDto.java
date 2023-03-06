package com.localtravel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MenuDto {
	private String menufcode;		// 가게코드(FK - Food_fcode)
	private String menuthcode;
	private MultipartFile mfile1;   // 업로드한 사진파일1
	private String mpicture1;       // 업로드한 사진코드1
	private String menuname1; 		// 대표메뉴1 이름
	private int menuprice1;   		// 대표메뉴1 가격
	private String menuexplain1;    // 대표메뉴1 설명
	
	private MultipartFile mfile2;   // 업로드한 사진파일2
	private String mpicture2;       // 업로드한 사진코드2
	private String menuname2;		// 대표메뉴2 이름
	private int menuprice2;		    // 대표메뉴2 가격
	private String menuexplain2;	// 대표메뉴2 설명
	
	private MultipartFile mfile3;   // 업로드한 사진파일3
	private String mpicture3;       // 업로드한 사진코드3
	private String menuname3;		// 대표메뉴3 이름
	private int menuprice3;		    // 대표메뉴3 가격	
	private String menuexplain3;	// 대표메뉴3 설명
	public String getMenufcode() {
		return menufcode;
	}
	public void setMenufcode(String menufcode) {
		this.menufcode = menufcode;
	}
	public String getMenuthcode() {
		return menuthcode;
	}
	public void setMenuthcode(String menuthcode) {
		this.menuthcode = menuthcode;
	}
	public MultipartFile getMfile1() {
		return mfile1;
	}
	public void setMfile1(MultipartFile mfile1) {
		this.mfile1 = mfile1;
	}
	public String getMpicture1() {
		return mpicture1;
	}
	public void setMpicture1(String mpicture1) {
		this.mpicture1 = mpicture1;
	}
	public String getMenuname1() {
		return menuname1;
	}
	public void setMenuname1(String menuname1) {
		this.menuname1 = menuname1;
	}
	public int getMenuprice1() {
		return menuprice1;
	}
	public void setMenuprice1(int menuprice1) {
		this.menuprice1 = menuprice1;
	}
	public String getMenuexplain1() {
		return menuexplain1;
	}
	public void setMenuexplain1(String menuexplain1) {
		this.menuexplain1 = menuexplain1;
	}
	public MultipartFile getMfile2() {
		return mfile2;
	}
	public void setMfile2(MultipartFile mfile2) {
		this.mfile2 = mfile2;
	}
	public String getMpicture2() {
		return mpicture2;
	}
	public void setMpicture2(String mpicture2) {
		this.mpicture2 = mpicture2;
	}
	public String getMenuname2() {
		return menuname2;
	}
	public void setMenuname2(String menuname2) {
		this.menuname2 = menuname2;
	}
	public int getMenuprice2() {
		return menuprice2;
	}
	public void setMenuprice2(int menuprice2) {
		this.menuprice2 = menuprice2;
	}
	public String getMenuexplain2() {
		return menuexplain2;
	}
	public void setMenuexplain2(String menuexplain2) {
		this.menuexplain2 = menuexplain2;
	}
	public MultipartFile getMfile3() {
		return mfile3;
	}
	public void setMfile3(MultipartFile mfile3) {
		this.mfile3 = mfile3;
	}
	public String getMpicture3() {
		return mpicture3;
	}
	public void setMpicture3(String mpicture3) {
		this.mpicture3 = mpicture3;
	}
	public String getMenuname3() {
		return menuname3;
	}
	public void setMenuname3(String menuname3) {
		this.menuname3 = menuname3;
	}
	public int getMenuprice3() {
		return menuprice3;
	}
	public void setMenuprice3(int menuprice3) {
		this.menuprice3 = menuprice3;
	}
	public String getMenuexplain3() {
		return menuexplain3;
	}
	public void setMenuexplain3(String menuexplain3) {
		this.menuexplain3 = menuexplain3;
	}
	
	
	
}
