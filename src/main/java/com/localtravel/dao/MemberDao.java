package com.localtravel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.MemberDto;

public interface MemberDao {
	@Insert("INSERT INTO MEMBERS (MID, MPW, MNAME, MBIRTH, MGENDER, MEMAIL, MPHONE, MSTATE) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth},'YYYY-MM-DD'), #{mgender}, #{memail}, "
			+ "#{mphone}, '0' )")
	int insertMemberJoin(MemberDto member);

	
	
	/* 로그인 기능 SELECT -> MEMBERDTO */
	@Select("SELECT * FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw} AND MSTATE = '0'")
	MemberDto memberLogin(MemberDto member);



	@Select("SELECT MID "
			+ "FROM MEMBERS "
			+ "WHERE MID = #{inputId}")
	String idCheck(String inputId);


	@Select("SELECT * FROM MEMBERS WHERE MID=#{mid}")
	ArrayList<MemberDto> selectMemberList_Rank(String mid);
	
	
	
}
