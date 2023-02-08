package com.localtravel.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.localtravel.dao.TrainDao;
import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.dto.TRInputScheduleDto;
import com.localtravel.dto.TRStationDto;

@Service
public class TrainReserveService {
	
	@Autowired
	TrainDao trdao;
	
	@Autowired
	TrainService trsvc;
	
	public ArrayList<TRCityCodeDto> getCityList() {
		ArrayList<TRCityCodeDto> cityList = trdao.selectCityList();
		return cityList;
	}

	public String getStationList(String citycode) {
		JsonArray jsonArray = new JsonArray();
		ArrayList<TRStationDto> staList = trdao.selectStaList(citycode);
		Gson gson = new Gson();
		for(int i = 0; i < staList.size(); i++) {
			JsonObject obj = new JsonObject();
			obj.addProperty("citycode", citycode);
			obj.addProperty("nodeid", staList.get(i).getNodeid());
			obj.addProperty("nodename",staList.get(i).getNodename());		
			jsonArray.add(obj);
			
		}
		
		return gson.toJson(jsonArray);
	}

	public String getArrStationList(String nodename) {
		JsonArray jsonArray = new JsonArray();
		ArrayList<TRStationDto> staList = trdao.selectArrStaion(nodename);
		Gson gson = new Gson();
		for(int i = 0; i < staList.size(); i++) {
			JsonObject obj = new JsonObject();
			obj.addProperty("citycode", staList.get(i).getNocitycode());
			obj.addProperty("nodeid", staList.get(i).getNodeid());
			obj.addProperty("nodename",staList.get(i).getNodename());			
			jsonArray.add(obj);
			
		}
		return gson.toJson(jsonArray);
	}

	public String searchTRSchedule(TRInputScheduleDto scheduleInfo) throws Exception{
		//날짜 입력기 
		String InputDate = scheduleInfo.getDepPlandTime().replace("-", "");
		System.out.println("변환된 날짜값 : " + InputDate);
		scheduleInfo.setDepPlandTime(InputDate);
		System.out.println(scheduleInfo);
		//API를 통해 열차 시간을 불러온다.
		String ScheduleList = trsvc.searchSchedule(scheduleInfo);
		
		
		return ScheduleList;
	}

}
