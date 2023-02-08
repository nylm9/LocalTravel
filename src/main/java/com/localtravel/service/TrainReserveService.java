package com.localtravel.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.localtravel.dao.TrainDao;
import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.dto.TRInputScheduleDto;
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

	public String searchTRSchedule(TRInputScheduleDto scheduleInfo) {
		// 현재 날짜 계산 
		ArrayList<String> DayList = new ArrayList<String>();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String dateTime = dateFormat.format(new Date());
        
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, 1);
        Date date = cal.getTime();
        String nextMonth = dateFormat.format(date);
        System.out.println("현재시간: "+dateTime);
        System.out.println("다음달까지: " + nextMonth);
        
        // 일자 수정 00 ~ 00 일까지
        for(int i = 0; i <= 10; i++) {
        	int Months = Integer.parseInt(dateTime.substring(4, 6));
            int days = Integer.parseInt(dateTime.substring(6, 8));
            if(Months == 2) {
            	//28
            	if(days == 28) {
            		days = 0;
            		Months += 1;
            	}
            } else if (Months == 1 || Months == 3 || Months == 5 || Months == 7 || Months == 8 || Months == 10 || Months == 12) {
            	//31
            	if(days == 31) {
            		days = 0;
            		Months += 1;
            	}
            } else {
            	//30
            	if(days == 30) {
            		days = 0;
            		Months += 1;
            	}
            }
            days+=1;
            String day = String.format("%02d", days);
            String month = String.format("%02d", Months);
            dateTime = "2023" + month + day;
            System.out.println(dateTime);
            DayList.add(dateTime);
        }
        System.out.println(DayList);
        
        // 날짜 출력을 위한 Json에 값 담기
        for(int i = 0; i < DayList.size(); i++) {
			JsonObject obj = new JsonObject();
			String Day = DayList.get(i);
//			obj.addProperty("year", staList.get(i).getNocitycode());
//			obj.addProperty("month", staList.get(i).getNodeid());
//			obj.addProperty("day",staList.get(i).getNodename());			
//			jsonArray.add(obj);
			
		}

        
		return null;
	}

}
