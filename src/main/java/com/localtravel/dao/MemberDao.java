package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	ArrayList<Map<String, String>> selectMemberList_Rank(@Param("mid")String loginId);


	@Update("UPDATE MEMBERS set MNAME=#MPHONE = #{mphone} WHERE MID=#{mid};")
	int updateBoard(MemberDto memBoard);




	
	
	
}
