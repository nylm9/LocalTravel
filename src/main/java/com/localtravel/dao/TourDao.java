package com.localtravel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodReviewDto;
import com.localtravel.dto.ReviewDto;

public interface TourDao {
	@Insert("INSERT INTO REVIEWS(RVENCODE, RVMID, RVCOMMENT, RVRECOMMEND, RVDATE)"
			+ " VALUES(#{rvencode}, #{rvmid}, #{rvcomment}, #{rvrecommend}, SYSDATE)")
	int insertReviewWrite(ReviewDto review);

	@Insert("INSERT INTO FDREVIEWES(RVFDCODE, RVMID, RVCOMMENT, RVRECOMMEND, RVDATE, RVFDTHCODE)"
			+ " VALUES(#{rvfdcode}, #{rvmid}, #{rvcomment}, #{rvrecommend}, SYSDATE, #{rvfdthcode})")
	int insertfdReviewWrite(FoodReviewDto fdreview);
	
	@Select("SELECT * FROM ENJOY WHERE ECODE = #{ecode}")
	EnjoyDto enjoyInfodao(String encode);

	
	@Select("SELECT * FROM ENJOY "
			+ "WHERE ETHCODE LIKE '%'||#{thcode}||'%' ")
	ArrayList<EnjoyDto> getEnjoySelectList(String thcode);
	
	
}
