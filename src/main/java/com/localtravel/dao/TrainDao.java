package com.localtravel.dao;

import org.apache.ibatis.annotations.Insert;

import com.localtravel.dto.TRCityCodeDto;

public interface TrainDao {
	
	@Insert("INSERT INTO TRCITYCODE(CITYCODE, CITYNAME) "
			+ "VALUES(#{citycode}, #{cityname})")
	int getCityCodeInfo(TRCityCodeDto city);

}
