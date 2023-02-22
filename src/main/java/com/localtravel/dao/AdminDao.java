package com.localtravel.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.MenuDto;

public interface AdminDao {
	@Insert("INSERT INTO ENJOY(ECODE, ENAME, ELCODE, EADDR, ETELL, EREPUTE, EEXPLAIN, ETHCODE, EPICTURE) "
			+ "VALUES( #{ecode}, #{ename}, #{elcode}, #{eaddr}, #{etell}, '0', #{eexplain}, #{ethcode}, #{epicture}   ) ")
	int insertEdata(EnjoyDto enjoy);

	@Select("SELECT MAX(ECODE) AS ECODE FROM ENJOY")
	String selectMaxEcode();

	@Select("SELECT ECODE FROM ENJOY WHERE ENAME = #{inputEname} AND EADDR = #{inputEaddr} ")
	ArrayList<Map<String, String>> enjoyCheck(@Param("inputEname") String inputEname,
			@Param("inputEaddr") String inputEaddr);

	@Select("SELECT FCODE FROM FOOD WHERE FNAME = #{inputFname} AND FADDR= #{inputFaddr}")
	ArrayList<Map<String, String>> foodCheck(@Param("inputFname") String inputFname,
			@Param("inputFaddr") String inputFaddr);

	@Select("SELECT * FROM ENJOY")
	ArrayList<EnjoyDto> selectEnjoyList();

	@Select("SELECT MAX(FCODE) AS FCODE FROM FOOD")
	String selectMaxFcode();

	@Insert("INSERT INTO FOOD(FCODE, FNAME, F1EX,FLCODE, FADDR, FTELL, FREPUTE, FEXPLAIN, FTHCODE, FPICTURE) "
			+ "VALUES( #{fcode}, #{fname}, #{f1ex}, #{flcode}, #{faddr}, #{ftell}, '0', #{fexplain}, #{fthcode}, #{fpicture} ) ")
	int insertFdata(FoodDto food);

	@Select("SELECT * FROM FOOD WHERE FNAME LIKE  '%'||#{inputval}||'%' ")
	ArrayList<FoodDto> selectAllFoodList(String inputval);

	
	  @Insert("INSERT INTO MENU(MENUFCODE,MPICTURE1,MENUNAME1,MENUPRICE1,MENUEXPLAIN1, " +
			  	"MPICTURE2,MENUNAME2,MENUPRICE2,MENUEXPLAIN2,MPICTURE3,MENUNAME3,MENUPRICE3,MENUEXPLAIN3,MENUTHCODE) "
			  	+ "VALUES( #{menufcode}, #{mpicture1},#{menuname1}, #{menuprice1}, #{menuexplain1}, "
			  	+ "#{mpicture2},#{menuname2}, #{menuprice2}, #{menuexplain2}, #{mpicture3},#{menuname3}, #{menuprice3}, #{menuexplain3}, "
			  	+ "#{menuthcode} )")
	int insertMdata(MenuDto menu);

	 @Select("SELECT * FROM FOOD")
	ArrayList<FoodDto> selectFoodList();

	@Select("SELECT * FROM MENU WHERE MENUFCODE = #{selectFcode}")
	ArrayList<MenuDto> selectFoodMenu(String selectFcode);

}
