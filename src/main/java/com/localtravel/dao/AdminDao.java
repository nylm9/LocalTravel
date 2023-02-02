package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;

public interface AdminDao {
	@Insert("INSERT INTO ENJOY(ECODE, ENAME, ELCODE, EADDR, ETELL, EREPUTE, EEXPLAIN, ETHCODE, EPICTURE) "
			+ "VALUES( #{ecode}, #{ename}, #{elcode}, #{eaddr}, #{etell}, '0', #{eexplain}, #{ethcode}, #{epicture}   ) ")
	int insertEdata(EnjoyDto enjoy);

	@Select("SELECT MAX(ECODE) AS ECODE FROM ENJOY")
	String selectMaxEcode();

	@Select("SELECT ECODE FROM ENJOY WHERE ENAME = #{inputEname} AND EADDR = #{inputEaddr} ")
	ArrayList<Map<String, String>> enjoyCheck( @Param("inputEname")String inputEname, @Param("inputEaddr")String inputEaddr);

	@Select("SELECT FCODE FROM FOOD WHERE FNAME = #{inputFname} AND FADDR= #{inputFaddr}")
	ArrayList<Map<String, String>> foodCheck(@Param("inputFname")String inputFname, @Param("inputFaddr")String inputFaddr);
	
	@Select("SELECT * FROM ENJOY")
	ArrayList<EnjoyDto> selectEnjoyList();

	@Select("SELECT MAX(FCODE) AS FCODE FROM FOOD")
	String selectMaxFcode();

	@Insert("INSERT INTO FOOD(FCODE, FNAME, FLCODE, FADDR, FTELL, FREPUTE, FEXPLAIN, FTHCODE, FPICTURE) "
			+ "VALUES( #{fcode}, #{fname}, #{flcode}, #{faddr}, #{ftell}, '0', #{fexplain}, #{fthcode}, #{fpicture} ) ")
	int insertFdata(FoodDto food);

	
	


}
