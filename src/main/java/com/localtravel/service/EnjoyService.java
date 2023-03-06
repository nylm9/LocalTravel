package com.localtravel.service;

import java.util.ArrayList;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.localtravel.dao.EnjoyDao;
import com.localtravel.dto.BlogDto;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.LikeBtnDto;
import com.localtravel.dto.LikeFoodBtnDto;
import com.localtravel.dto.MenuDto;


@Service
public class EnjoyService {

	@Autowired
	private EnjoyDao endao;


	public EnjoyDto getenjoyInfo(String ecode) {
		System.out.println("SERVICE - 놀거리상세보기");
		EnjoyDto enInfo = endao.selectenjoyInfo(ecode);
		System.out.println(enInfo);
		return enInfo;
	}

	public ArrayList<Map<String, String>> getReviewList(String ecode) {
		System.out.println("service - 리뷰목록");
		ArrayList<Map<String,String>>reviewList = endao.selectReviewList(ecode);
		System.out.println(reviewList);
		return reviewList;
	}


	public ArrayList<EnjoyDto> getenjoyList() {
		System.out.println("service - 놀거리페이지출력");
		ArrayList<EnjoyDto> enList = endao.selectenjoyList_Rank();
		System.out.println(enList);
		return enList;
	}

	public ArrayList<FoodDto> getfoodList() {
		System.out.println("service - 먹거리페이지");
		ArrayList<FoodDto> fdList = endao.selectfoodList_Rank();
		System.out.println(fdList);
		return fdList;
	}

	
	public ArrayList<MenuDto> getMenuList(String fcode) {
		System.out.println("service - 먹거리 메뉴");
		ArrayList<MenuDto> mnList = endao.selectMenuList_Rank(fcode);
		System.out.println(mnList);
		return mnList;
	}

	public FoodDto getfoodInfo(String fcode) {
		System.out.println("SERVICE - 먹거리상세보기");
		FoodDto fdInfo = endao.selectfoodInfo(fcode);
		System.out.println(fdInfo);
		return fdInfo;
	}

	public ArrayList<Map<String, String>> getfoodReviewList(String fcode) {
		System.out.println("service - 먹거리리뷰목록");
		ArrayList<Map<String,String>> fdreviewList = endao.selectfdReviewList(fcode);
		System.out.println(fdreviewList);
		return fdreviewList;
	}

	public String getBlogwriteList(BlogDto bto) {
		System.out.println("enjoyservice - 블로그글작성");
		int WriteResult =endao.getBlogListdao(bto);
		System.out.println(WriteResult);
		return WriteResult+"";
	}

	public ArrayList<BlogDto> getbloglist() {
		System.out.println("service - 블로그내용블로그페이지에출력");
		ArrayList<BlogDto> blList = endao.selectblogList();
		System.out.println(blList);
		return blList;
		
	}

	public ArrayList<EnjoyDto> getenjoyListBlog(String ecode) {
		System.out.println("service - 놀거리블로그페이지에출력");
		ArrayList<EnjoyDto> enList = endao.selectenjoyListBlog(ecode);
		System.out.println(enList);
		return enList;
	}

	public ArrayList<BlogDto> getbloglistBlog(String ecode) {
		System.out.println("service - 블로그내용블로그페이지에출력");
		ArrayList<BlogDto> blList = endao.selectblogListBlog(ecode);
		System.out.println(blList);
		return blList;
	}

	public BlogDto getbloglistBllog(String ecode) {
		System.out.println("service - 블로그내용블로그페이지에출력");
		BlogDto blList = endao.selectblogListBllog(ecode);
		System.out.println(blList);
		return blList;
	}

	public EnjoyDto getenjoyList2() {
		System.out.println("enjoyservice - 블로그글메인창에 출력");
		EnjoyDto bList = endao.selectbList2();
		System.out.println(bList);
		return bList;
	}







	public String setleList(LikeBtnDto lelike) {
		System.out.println("enjoyService - 놀거리페이지 좋아요버튼");
		String checkLike = endao.selectCheckLike(lelike);
		if(checkLike == null) {
			System.out.println("service-인서트작동");
			int lelikeResult = endao.insertEnjoyLike(lelike);
			System.out.println(lelikeResult);
			return lelikeResult+"";
			
		}
		// SELECT CODE FROM TBL WHERE 아이디 = ? AND 코드 = ?;
		else {
			System.out.println("service-이미 이 아이디로 저장되어 있음");
			return "0";
		}
	}

	public String setleListFood(LikeFoodBtnDto leflike) {
		System.out.println("enjoyService - 먹거리페이지 좋아요버튼");
		String checkFLike = endao.selectFoodCheckLike(leflike);
		if(checkFLike == null) {
			System.out.println("service-인서트작동");
			int lelikeResult = endao.insertFoodLike(leflike);
			System.out.println("놀거리인서트:"+lelikeResult);
			return lelikeResult+"";
			
		}
		// SELECT CODE FROM TBL WHERE 아이디 = ? AND 코드 = ?;
		else {
			System.out.println("service-이미 이 아이디로 저장되어 있음");
			return "0";
		}
	}



	public ArrayList<BlogDto> getBlogList(String ecode) {
		System.out.println("enjoyService -블로그 추천 띄우기");
		ArrayList<BlogDto> blList = endao.selectBlogList_Rank(ecode);
		System.out.println(blList);
		return blList;
	}





















}
