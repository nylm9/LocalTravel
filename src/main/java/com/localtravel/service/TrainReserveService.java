package com.localtravel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.localtravel.dao.TrainDao;
import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.dto.TRStationDto;

@Service
public class TrainReserveService {
	
	@Autowired
	TrainDao trdao;
	
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

}
