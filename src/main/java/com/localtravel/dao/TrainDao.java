package com.localtravel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.dto.TRStationDto;

public interface TrainDao {
	
	// getCityCodeInfo() - 도시코드 입력 
	@Insert("INSERT INTO TRCITYCODE(CITYCODE, CITYNAME) "
			+ "VALUES(#{citycode}, #{cityname})")
	int getCityCodeInfo(TRCityCodeDto city);
	
	// getStaionCodeInfo() - 도시코드 출력
	@Select("SELECT CITYCODE FROM TRCITYCODE")
	ArrayList<TRCityCodeDto> selectCityCode();
	
	// getStaionCodeInfo() - 역 정보 입력 
	@Insert("INSERT INTO TRSTATIONCODE(NODEID, NODENAME, NOCITYCODE) "
			+ "VALUES(#{nodeid}, #{nodename}, #{nocitycode})")
	int getStaionCodeInfo(TRStationDto station);

}
