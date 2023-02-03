package com.localtravel.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.dto.TRInputScheduleDto;
import com.localtravel.dto.TRRouteDto;
import com.localtravel.dto.TRStationDto;

public interface TrainDao {
	
	// getCityCodeInfo() - 도시코드 입력 
	@Insert("INSERT INTO TRCITYCODE(CITYCODE, CITYNAME) "
			+ "VALUES(#{citycode}, #{cityname})")
	int getCityCodeInfo(TRCityCodeDto city);
	
	/* SERVICE - getStaionCodeInfo()내 SQL */
	
	// getStaionCodeInfo() - 도시코드 출력
	@Select("SELECT CITYCODE FROM TRCITYCODE")
	ArrayList<TRCityCodeDto> selectCityCode();
	
	// getStaionCodeInfo() - 역 정보 입력 
	@Insert("INSERT INTO TRSTATIONCODE(NODEID, NODENAME, NOCITYCODE) "
			+ "VALUES(#{nodeid}, #{nodename}, #{nocitycode})")
	int getStaionCodeInfo(TRStationDto station);

	/* SERVICE - searchSchedule()내 SQL */
	
	// 열차 정보 출력 관련 DAO
	
	@Select("SELECT NODEID FROM TRSTATIONCODE WHERE NODENAME = #{StationId}")
	String selectStationId(String StationId);
	
	@Insert("INSERT INTO TRROUTE(ROUTECODE,ROUTEKR,DEPSTA,ARRSTA,NORMALFARE,SPECIALFARE) "
			+ "VALUES(#{routecode}, #{routekr}, #{depsta}, #{arrsta}, #{normalfare}, #{specialfare})")
	int insertRouteList(TRRouteDto routeInfo);

	@Select("SELECT * FROM TRROUTE WHERE ROUTECODE = #{routecode} AND DEPSTA = #{depsta} AND ARRSTA = #{arrsta}")
	TRRouteDto selectNormalFare(TRRouteDto routedata);
	
	@Select("SELECT ROUTECODE FROM TRROUTE WHERE DEPSTA = #{depSta} AND ARRSTA=#{arrSta}")
	ArrayList<String> selectTrainType(TRRouteDto selectRoute);
	
	@Select("SELECT ROUTECODE FROM TRROUTE WHERE DEPSTA = #{depPlaceId} AND ARRSTA=#{arrPlaceId}")
	ArrayList<String> selectTyroute(TRInputScheduleDto inputSchedule);
	
	// TrainReserve 관련 DAO
	
	// 예매부분 출력을 위한 도시코드를 가져옵니다.
	@Select("SELECT * FROM TRCITYCODE")
	ArrayList<TRCityCodeDto> selectCityList();
	// 예매부분 출력을 위한 도시코드를 기반으로 한 역사 정보를 가져옵니다.
	@Select("SELECT * FROM TRSTATIONCODE WHERE NOCITYCODE = #{citycode}")
	ArrayList<TRStationDto> selectStaList(String citycode);
	
	
	
	
	
}
