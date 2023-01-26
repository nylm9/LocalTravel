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

@Service
public class TrainService {
	
	@Autowired
	TrainDao trdao;
	
	// 열차-도시코드 가져오기
	public int getCityCodeInfo() throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=rcDIgqtDvPLJ95VNJCSK44R1cExWDo42RSBvLWAV9IglwBSjU5fsECwXMglNDmsEk%2BxoZypGMP1kn72z0jXbcw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        // 가져온 공공데이터 Json타입 => Array타입으로 변환
        Gson js = new Gson();
		
		JsonElement element = JsonParser.parseString(sb.toString());
		JsonObject body = element.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject();
		JsonArray obj = body.get("items").getAsJsonObject().get("item").getAsJsonArray();
		System.out.println(obj);
		
		// 도시코드 DB에 삽입
		int insertResult = 0;
		for(int i = 0; i < obj.size(); i++) {
			TRCityCodeDto city = new TRCityCodeDto();
			String citycode = obj.get(i).getAsJsonObject().get("citycode").getAsString();
			String cityname = obj.get(i).getAsJsonObject().get("cityname").getAsString();
			city.setCitycode(citycode);
			city.setCityname(cityname);
			insertResult += trdao.getCityCodeInfo(city);
		}
		
		System.out.println("=========================================================");
		
		// insert 작업 완료
		System.out.println(insertResult);
		if(insertResult > 0) {
			System.out.println("insert 작업 완료");
		} else {
			System.out.println("insert 작업 실패");			
		}
		
		return 0;
	}

}
