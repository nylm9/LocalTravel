package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.EnjoyDto;

public interface AdminDao {
	@Insert("INSERT INTO ENJOY(ECODE, ENAME, ELCODE, EADDR, ETELL, EREPUTE, EEXPLAIN, ETHCODE, EPICTURE) "
			+ "VALUES( #{ecode}, #{ename}, #{elcode}, #{eaddr}, #{etell}, '0', #{eexplain}, #{ethcode}, #{epicture}   ) ")
	int insertEdata(EnjoyDto enjoy);

	@Select("SELECT MAX(ECODE) AS ECODE FROM ENJOY")
	String selectMaxEcode();

	@Select("SELECT ENAME FROM ENJOY WHERE ENAME = #{inputEname} AND EADDR = #{inputEaddr} ")
	ArrayList<Map<String, String>> enjoyCheck( @Param("inputEname")String inputEname, @Param("inputEaddr")String inputEaddr);
	


}
