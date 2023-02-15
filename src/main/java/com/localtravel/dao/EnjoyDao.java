package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.BlogDto;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.MenuDto;

public interface EnjoyDao {
	
	//놀거리
	@Select("SELECT * FROM ENJOY  "
			+ " WHERE ECODE = #{ecode}")
	EnjoyDto selectenjoyInfo(String ecode);

	@Select("SELECT * FROM REVIEWS RV"
			+ " INNER JOIN ENJOY EN ON RV.RVENCODE = EN.ECODE "
			+ " WHERE EN.ECODE = #{ecode}")
	ArrayList<Map<String, String>> selectReviewList(String ecode);
	
	@Select("SELECT * FROM ENJOY")
	ArrayList<EnjoyDto> selectenjoyList_Rank();

	
	//먹거리
	@Select("SELECT * FROM FOOD")
	ArrayList<FoodDto> selectfoodList_Rank();

	@Select("SELECT * FROM FOOD WHERE FCODE = #{fcode}")
	FoodDto selectfoodInfo(String fcode);
	
	@Select("SELECT * FROM FDREVIEWES FR INNER JOIN FOOD FD ON FR.RVFDCODE = FD.FCODE WHERE FD.FCODE = #{fcode}")
	ArrayList<Map<String, String>> selectfdReviewList(String fcode);

	@Select("SELECT * FROM MENU MN INNER JOIN FOOD FD ON MN.MENUFCODE = FD.FCODE  WHERE FD.FCODE =#{fcode}")
	ArrayList<MenuDto> selectMenuList_Rank(String fcode);



	@Insert("INSERT INTO BLOG(BCODE,BCONTENT) VALUES (#{bcode},#{bcontent})")
	int getBlogListdao(BlogDto bto);

	@Select("SELECT * FROM BLOG")
	ArrayList<BlogDto> selectbList();

	@Select("SELECT * FROM ENJOY WHERE ECODE = #{ecode}")
	ArrayList<EnjoyDto> selectenjoyListBlog(String ecode);

	@Select("SELECT * FROM BLOG WHERE BCODE = #{bcode}")
	ArrayList<BlogDto> selectblogListBlog(String ecode);
	
	@Select("SELECT * FROM BLOG WHERE BCODE = #{bcode}")
	BlogDto selectblogListBllog(String ecode);

	@Select("SELECT * FROM BLOG")
	EnjoyDto selectbList2();
	
	@Select("SELECT * FROM BLOG")
	ArrayList<BlogDto> selectblogList();


	

	



}
