package com.localtravel.dao;

import org.apache.ibatis.annotations.Insert;

import com.localtravel.dto.ReviewDto;

public interface TourDao {
	@Insert("INSERT INTO REVIEWS(RVENCODE, RVMID, RVCOMMENT, RVRECOMMEND, RVDATE)"
			+ " VALUES(#{rvrecode}, #{rvmid}, #{rvcomment}, #{rvrecommend}, SYSDATE)")
	int insertReviewWrite(ReviewDto review);

}
