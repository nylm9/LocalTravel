package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.localtravel.dto.FoodDto;
import com.localtravel.dto.LikeBtnDto;
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


	


	@Update("UPDATE MEMBERS set MNAME=#{mname},MBIRTH=TO_DATE(#{mbirth},'YYYY-MM-DD'),MGENDER=#{mgender},MPHONE=#{mphone},MEMAIL=#{memail},MSTATE='0' WHERE MID=#{mid}")
int updateBoard(MemberDto memberDto);


	@Select("SELECT * FROM MEMBERS WHERE MID=#{mid}")
	MemberDto selectfoodInfo(String loginId);


	@Select("SELECT * FROM MEMBERS WHERE MID=#{mid}")
	ArrayList<Map<String, String>> selectMemberList_Rank(String loginId);


@Select("SELECT * FROM LIKEBTN WHERE LBMID=#{lbmid}")
	ArrayList<LikeBtnDto> selectlikeList(String loginId);




	
	
	
}
