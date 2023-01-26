package com.localtravel.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
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
public class TrainService {

	@Autowired
	TrainDao trdao;

	// 1. 열차-도시코드 가져오기
	public int getCityCodeInfo() throws Exception {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=rcDIgqtDvPLJ95VNJCSK44R1cExWDo42RSBvLWAV9IglwBSjU5fsECwXMglNDmsEk%2BxoZypGMP1kn72z0jXbcw%3D%3D"); /*
																														 * Service
																														 * Key
																														 */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* 데이터 타입(xml, json) */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
		for (int i = 0; i < obj.size(); i++) {
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
		if (insertResult > 0) {
			System.out.println("insert 작업 완료");
		} else {
			System.out.println("insert 작업 실패");
		}

		return 0;
	}

	// 2. 열차 - 역코드 가져오기
	public int getStaionCodeInfo() throws Exception {

		// 2.1. 도시코드 가져오기
		ArrayList<TRCityCodeDto> citycodes = trdao.selectCityCode();
//		System.out.println(citycodes);
		int insertResult = 0;

		for (int i = 0; i < citycodes.size(); i++) {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=rcDIgqtDvPLJ95VNJCSK44R1cExWDo42RSBvLWAV9IglwBSjU5fsECwXMglNDmsEk%2BxoZypGMP1kn72z0jXbcw%3D%3D"); /* *Service* Key*/
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("200", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
					+ URLEncoder.encode("json", "UTF-8")); /* 데이터 타입(xml, json) */
			urlBuilder.append("&" + URLEncoder.encode("cityCode", "UTF-8") + "="
					+ URLEncoder.encode(citycodes.get(i).getCitycode(), "UTF-8")); /* 시/도 ID */
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
//	        System.out.println(sb.toString());

			JsonElement element = JsonParser.parseString(sb.toString());
			JsonObject body = element.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject();
			JsonArray obj = body.get("items").getAsJsonObject().get("item").getAsJsonArray();
//			System.out.println(obj);

			for (int j = 0; j < obj.size(); j++) {
				TRStationDto station = new TRStationDto();
				station.setNodeid(obj.get(j).getAsJsonObject().get("nodeid").getAsString());
				station.setNodename(obj.get(j).getAsJsonObject().get("nodename").getAsString());
				station.setNocitycode(citycodes.get(i).getCitycode());
				System.out.print(station + ", ");
				insertResult += trdao.getStaionCodeInfo(station);
			}

			System.out.println("=".repeat(80));

		}

		System.out.println(insertResult);
		// insert 작업 완료
		System.out.println(insertResult);
		if (insertResult > 0) {
			System.out.println("insert 작업 완료");
		} else {
			System.out.println("insert 작업 실패");
		}

		return 0;
	}


	// 3. 열차 스케줄 가져오기 ( 예매시 사용할 스케쥴 모음 )
	public String searchSchedule(TRInputScheduleDto inputSchedule) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=rcDIgqtDvPLJ95VNJCSK44R1cExWDo42RSBvLWAV9IglwBSjU5fsECwXMglNDmsEk%2BxoZypGMP1kn72z0jXbcw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); //페이지번호
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); //한 페이지 결과 수
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); //데이터 타입(xml, json)
        urlBuilder.append("&" + URLEncoder.encode("depPlaceId","UTF-8") + "=" + URLEncoder.encode(inputSchedule.getDepPlaceId(), "UTF-8")); //출발기차역ID
        urlBuilder.append("&" + URLEncoder.encode("arrPlaceId","UTF-8") + "=" + URLEncoder.encode(inputSchedule.getArrPlaceId(), "UTF-8")); //도착기차역ID
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(inputSchedule.getDepPlandTime(), "UTF-8")); //출발일(YYYYMMDD)
        urlBuilder.append("&" + URLEncoder.encode("trainGradeCode","UTF-8") + "=" + URLEncoder.encode("00", "UTF-8")); //차량종류코드( 00 - KTX )
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
        System.out.println(sb.toString());
		
		
		return null;
	}

}
