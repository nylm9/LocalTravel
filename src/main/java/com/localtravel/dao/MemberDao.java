package com.localtravel.dao;

import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.MemberDto;

public interface MemberDao {
	
	
	/* 로그인 기능 SELECT -> MEMBERDTO */
	@Select("SELECT * FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw} AND MSTATE = '0'")
	MemberDto memberLogin(MemberDto member);
	
	
	
}
