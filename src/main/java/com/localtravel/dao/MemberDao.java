package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.LikeBtnDto;
import com.localtravel.dto.LikeFoodBtnDto;
import com.localtravel.dto.MemberDto;
import com.localtravel.dto.ReservationDto;

public interface MemberDao {
	/*
	 * @Insert("INSERT INTO MEMBERS (MID, MPW, MNAME, MBIRTH, MGENDER, MEMAIL, MPHONE, MSTATE) "
	 * +
	 * "VALUES(#{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth},'YYYY-MM-DD'), #{mgender}, #{memail}, "
	 * + "#{mphone}, '0' )") int insertMemberJoin(MemberDto member);
	 */
	@Insert("INSERT INTO MEMBERS (MID, MPW, MNAME, MBIRTH, MGENDER, MEMAIL, MPHONE, MSTATE) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, TO_CHAR(#{mbirth},'YYYY-MM-DD'), #{mgender}, #{memail}, "
			+ "#{mphone}, '0' )")
int insertMemberJoin(MemberDto member);


	
	
	/* 로그인 기능 SELECT -> MEMBERDTO */
	@Select("SELECT * FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw} AND MSTATE = '0'")
	MemberDto memberLogin(MemberDto member);



	@Select("SELECT MID "
			+ "FROM MEMBERS "
			+ "WHERE MID = #{inputId}")
	String idCheck(String inputId);


	


	@Update("UPDATE MEMBERS set MNAME=#{mname},MBIRTH=TO_CHAR(#{mbirth},'YYYY-MM-DD'),MGENDER=#{mgender},MPHONE=#{mphone},MEMAIL=#{memail},MSTATE='0' WHERE MID=#{mid}")
int updateBoard(MemberDto memberDto);


	@Select("SELECT * FROM MEMBERS WHERE MID=#{mid}")
	MemberDto selectfoodInfo(String loginId);


	@Select("SELECT MCODE, MID, MPW, MNAME, TO_CHAR(MBIRTH,'YYYY-MM-DD') AS MBIRTH, MGENDER, MEMAIL, MPHONE FROM MEMBERS WHERE MID=#{mid}")
	ArrayList<Map<String, String>> selectMemberList_Rank(String loginId);


@Select("SELECT * FROM LIKEBTN WHERE LBMID=#{lbmid}")
	ArrayList<LikeBtnDto> selectlikeList(String loginId);


@Select("SELECT * FROM ENJOY WHERE ECODE=#{lbcode}")
ArrayList<EnjoyDto> selectenjoyList();


@Select("SELECT * FROM ENJOY WHERE ECODE = #{ecode}")
EnjoyDto selectecodelikeList(String ecode);

@Select("SELECT * FROM LIKEFOODBTN WHERE LBFMID=#{lbfmid}")
ArrayList<LikeFoodBtnDto> selectlikeFoodList(String loginId);

@Select("SELECT * FROM FOOD WHERE FCODE = #{fcode}")
FoodDto selectecodelikeFoodList(String fcode);


/* @Select("SELECT * FROM RESERVATION WHERE REMID = #{remid}") */
@Select("SELECT RECODE, DEPSTA, ARRSTA, TRAINNO, DEPTIME, ARRTIME, CARNUM, SEATNUM, TO_CHAR(TRAINDATE,'YYYY-MM-DD')AS TRAINDATE, REDATE, CHARGE, RESTATES FROM"
		+ " RESERVATION WHERE REMID=#{loginId} AND RESTATES='0' ORDER BY TRAINDATE DESC" )
ArrayList<ReservationDto> selectreservationList(String loginId);

@Delete("DELETE  FROM LIKEBTN WHERE LBMID =#{lbmid} AND LBCODE =#{lbcode}")
int deleteenjoyResult(@Param("lbmid") String lbmid, @Param("lbcode") String lbcode);


@Delete("DELETE  FROM LIKEFOODBTN WHERE LBFMID =#{lbfmid} AND LBFCODE =#{lbfcode}")
int deleteFoodResult(@Param("lbfmid")String loginId, @Param("lbfcode")String fcode);








	
	
	
}
