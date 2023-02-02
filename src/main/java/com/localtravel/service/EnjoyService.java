package com.localtravel.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.localtravel.dao.EnjoyDao;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.PageDto;

@Service
public class EnjoyService {

	@Autowired
	private EnjoyDao endao;


	public EnjoyDto getenjoyInfo(String ecode) {
		System.out.println("SERVICE-놀거리상세보기");
		EnjoyDto enInfo = endao.selectenjoyInfo(ecode);
		System.out.println(enInfo);
		return enInfo;
	}

	public ArrayList<Map<String, String>> getReviewList(String ecode) {
		System.out.println("리뷰목록");
		ArrayList<Map<String,String>>reviewList = endao.selectReviewList(ecode);
		System.out.println(reviewList);
		return reviewList;
	}



}
