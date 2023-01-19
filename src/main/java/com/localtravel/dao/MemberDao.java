package com.localtravel.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.MemberDto;

public interface MemberDao {
	@Insert("INSERT INTO MEMBERS (MID, MPW, MNAME, MBIRTH, MGENDER, MEMAIL, MPHONE, MADDR, MSTATE) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth},'YYYY-MM-DD'), #{mgender}, #{memail}, "
			+ "#{mphone}, #{maddr}, '0' )")
	int insertMemberJoin(MemberDto member);

	
	
	/* 로그인 기능 SELECT -> MEMBERDTO */
	@Select("SELECT * FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw} AND MSTATE = '0'")
	MemberDto memberLogin(MemberDto member);
	
	
	
}
