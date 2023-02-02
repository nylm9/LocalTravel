package com.localtravel.service;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
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
import com.localtravel.dto.TRRouteDto;
import com.localtravel.dto.TRStationDto;

@Service
public class TrainService {

	@Autowired
	TrainDao trdao;

	// 3. 열차 스케줄 가져오기 ( 예매시 사용할 스케쥴 기능 )
	public String searchSchedule(TRInputScheduleDto inputSchedule) throws Exception {
		System.out.println("Service - searchSchedule()");
		// 1.1. 역이 중앙선, 강릉선인 경우
		System.out.println("=================(열차종류 세팅)====================");
		ArrayList<String> TYroute = new ArrayList<String>();
		String trainType = "00";
		System.out.println(inputSchedule);
		TYroute = trdao.selectTyroute(inputSchedule);
		System.out.println(TYroute.get(0));
		if(TYroute.get(0).equals("GL") || TYroute.get(0).equals("JA")) {
			trainType = "16";
		}
		System.out.println("열차종류 : " + trainType);
		System.out.println("=====================================================");
		
		// 1. 입력한 역의 이름을 역코드로 변환해준다. ( => SERVICE 3.1. )
		inputSchedule = changeStaionId(inputSchedule);
		
		
		// 2. 출/도착역의 정보를 입력 뒤 API를 통해 스케줄을 가져온다.
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=rcDIgqtDvPLJ95VNJCSK44R1cExWDo42RSBvLWAV9IglwBSjU5fsECwXMglNDmsEk%2BxoZypGMP1kn72z0jXbcw%3D%3D"); 
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); 
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("depPlaceId", "UTF-8") + "="
				+ URLEncoder.encode(inputSchedule.getDepPlaceId(), "UTF-8")); // 출발기차역ID
		urlBuilder.append("&" + URLEncoder.encode("arrPlaceId", "UTF-8") + "="
				+ URLEncoder.encode(inputSchedule.getArrPlaceId(), "UTF-8")); // 도착기차역ID
		urlBuilder.append("&" + URLEncoder.encode("depPlandTime", "UTF-8") + "="
				+ URLEncoder.encode(inputSchedule.getDepPlandTime(), "UTF-8")); // 출발일(YYYYMMDD)
		urlBuilder.append("&" + URLEncoder.encode("trainGradeCode", "UTF-8") + "=" + URLEncoder.encode(trainType, "UTF-8")); 
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
//      System.out.println(sb.toString());

		Gson gson = new Gson();
		JsonElement element = JsonParser.parseString(sb.toString());
//		System.out.println(element);
		JsonObject body = element.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject();
		JsonArray ScheduleArray = body.get("items").getAsJsonObject().get("item").getAsJsonArray();
		System.out.println(ScheduleArray.get(0));
		// 열차 운임비 데이터 넣어주는 메소드
		SelectTrainFare(ScheduleArray);
		System.out.println("데이터 조회 완료");
		return gson.toJson(ScheduleArray);
	}

	

	// 3.1. API양식에 맞게 입력한 역의 이름을 역코드로 변환 및 날짜 수정
	private TRInputScheduleDto changeStaionId(TRInputScheduleDto inputSchedule) {
		String DepSta = inputSchedule.getDepPlaceId();
		String ArrSta = inputSchedule.getArrPlaceId();
		if(DepSta.equals("여수엑스포")) {
			DepSta = "여수EXPO";
		} else if(ArrSta.equals("여수엑스포")) {
			ArrSta = "여수EXPO";
		}
		
		// 3.1.1. 출발역의 코드를 찾아준다.
		System.out.println("출발 : " + DepSta + ", " + "도착 : " + ArrSta);
		String depId = trdao.selectStationId(DepSta);
		System.out.println("찾은 출발역의 코드 : " + depId);

		// 3.1.2. 도착역의 코드를 찾아준다.
		String arrId = trdao.selectStationId(ArrSta);
		System.out.println("찾은 도착역의 코드 : " + arrId);

		// 3.1.3. 날짜데이터의 "-" 제거

		String setTime = inputSchedule.getDepPlandTime().replace("-", "");
		// 3.1.4. 
		
		
		// 3.2.1. 각 코드를 Dto에 통해준다.
		inputSchedule.setDepPlaceId(depId);
		inputSchedule.setArrPlaceId(arrId);
		inputSchedule.setDepPlandTime(setTime);
//		System.out.println("수정된 입력 정보 : " + inputSchedule);

		return inputSchedule;
	}

	// 4. CSV파일을 통한 열차 시간 가져오기( 열차시간 INSERT )
	public void fareCsv() {
		ArrayList<TRRouteDto> routeList = new ArrayList<TRRouteDto>();
		BufferedReader br = null;
		int insertResult = 0;
		try {
			br = Files.newBufferedReader(
					Paths.get("C:\\SpringWorkspace\\LocalTravel\\src\\test\\resources\\KTXFareInfo.csv"));
			Charset.forName("UTF-8");
			String line = "";

			while ((line = br.readLine()) != null) {
//            	System.out.println("line : " + line);
				// CSV 1행을 저장하는 리스트
				TRRouteDto routeInfo = new TRRouteDto();
				String array[] = line.split(",");
				// 배열에서 리스트 반환
				routeInfo.setRoutecode(array[0]);
				routeInfo.setRoutekr(array[1]);
				routeInfo.setDepsta(array[2]);
				routeInfo.setArrsta(array[3]);
				routeInfo.setNormalfare(array[4]);
				routeInfo.setSpecialfare(array[5]);
				insertResult += trdao.insertRouteList(routeInfo);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// 파일 => ARRAY 데이터("ret")로 변환

		System.out.println("===================================");
		if (insertResult > 0) {
			System.out.println("입력완료");
		} else {
			System.out.println("입력실패");
		}
	}

	// 5. DB를 통해 열차편성번호에 따른 역간의 운임비를 SELECT해준다.
	private void SelectTrainFare(JsonArray scheduleArray) throws Exception {
		FORFareSetting(scheduleArray);
		
	}



	/* 사용하지 않는 코드 ( 단일성 코드 ) */

	// 1. 열차-도시코드 가져오기
	public int getCityCodeInfo() throws Exception {
		
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1613000/TrainInfoService/getCtyCodeList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
				+ "=rcDIgqtDvPLJ95VNJCSK44R1cExWDo42RSBvLWAV9IglwBSjU5fsECwXMglNDmsEk%2BxoZypGMP1kn72z0jXbcw%3D%3D"); 
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "="
				+ URLEncoder.encode("json", "UTF-8")); /* 데이터 타입(xml, json) */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
//		System.out.println("Response code: " + conn.getResponseCode());
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
//		System.out.println(obj);

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

//		System.out.println("=========================================================");

		// insert 작업 완료
//		System.out.println(insertResult);
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
//			System.out.println(citycodes);
		int insertResult = 0;

		for (int i = 0; i < citycodes.size(); i++) {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=rcDIgqtDvPLJ95VNJCSK44R1cExWDo42RSBvLWAV9IglwBSjU5fsECwXMglNDmsEk%2BxoZypGMP1kn72z0jXbcw%3D%3D"); 																								 
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="+ URLEncoder.encode("200", "UTF-8")); /* 한 페이지 결과 수 */
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
//		        System.out.println(sb.toString());

			JsonElement element = JsonParser.parseString(sb.toString());
			JsonObject body = element.getAsJsonObject().get("response").getAsJsonObject().get("body").getAsJsonObject();
			JsonArray obj = body.get("items").getAsJsonObject().get("item").getAsJsonArray();
//				System.out.println(obj);

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

	// 5.1. 단축코드 - IF문 요금 설정 메소드
	public TRRouteDto settingRouteFare(TRRouteDto Routedata) throws Exception {
		
		String ArrSta = Routedata.getArrsta();
		String DepSta = Routedata.getDepsta();
		if(DepSta.equals("여수EXPO")) {
			Routedata.setDepsta("여수엑스포");
		} else if(ArrSta.equals("여수EXPO")) {
			Routedata.setArrsta("여수엑스포");
		}
		System.out.println("루트정보 : " + Routedata);
		TRRouteDto routeInfo = new TRRouteDto();
		routeInfo = trdao.selectNormalFare(Routedata);
		if (routeInfo == null) {
			routeInfo = new TRRouteDto();
			Routedata.setDepsta(ArrSta);
			Routedata.setArrsta(DepSta);
			routeInfo = trdao.selectNormalFare(Routedata);
		}
//		System.out.println("입력된 금액 : " + routeInfo.getNormalfare());
		return routeInfo;
	}

	// 5.2. FOR문 반복코드
	private void FORFareSetting(JsonArray scheduleArray) throws Exception{
		for (int i = 0; i < scheduleArray.size(); i++) {
			TRRouteDto Routedata = new TRRouteDto();
			int trainno = scheduleArray.get(i).getAsJsonObject().get("trainno").getAsInt();
			// 5.1. 열차번호 설정 ( trainno )

			if (trainno > 0 && trainno < 101 || trainno > 115 && trainno < 121 || trainno == 194 || trainno == 183) {
//				System.out.println("고속경부선");
				// 노선코드 설정 ( 수동 )
				Routedata.setRoutecode("KB");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 100 && trainno < 113 || trainno > 161 && trainno < 166) {
//				System.out.println("(구포 경유) 경부선");
				Routedata.setRoutecode("KBGP");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 120 && trainno < 129 || trainno > 169 && trainno < 174) {
//				System.out.println("(수원 경유) 경부선");
				Routedata.setRoutecode("KBSWSG");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 200 && trainno < 225 || trainno > 281 && trainno < 289) {
//				System.out.println("경전선 ( 진주행 )");
				Routedata.setRoutecode("KJ");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 230 && trainno < 255 || trainno > 290 && trainno < 299) {
//				System.out.println("동해선 ( 포항행 )");
				Routedata.setRoutecode("DH");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 400 && trainno < 441 || trainno > 490 && trainno < 493) {
//				System.out.println("호남선");
				Routedata.setRoutecode("HN");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 470 && trainno < 487 || trainno > 490 && trainno < 493) {
//				System.out.println("호남선 - 서대전 경유");
				Routedata.setRoutecode("HNGJ");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 500 && trainno < 525 || trainno > 540 && trainno < 591) {
//				System.out.println("전라선");
				Routedata.setRoutecode("JL");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				if(routeInfo != null) {
					scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
				}
			} else if (trainno > 800 && trainno < 829 || trainno > 840 && trainno < 865) {
//				System.out.println("강릉선");
				Routedata.setRoutecode("GL");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			} else if (trainno > 700 && trainno < 715 || trainno > 780 && trainno < 783) {
//				System.out.println("중앙선");
				Routedata.setRoutecode("JA");
				Routedata.setDepsta(scheduleArray.get(i).getAsJsonObject().get("depplacename").getAsString());
				Routedata.setArrsta(scheduleArray.get(i).getAsJsonObject().get("arrplacename").getAsString());
				TRRouteDto routeInfo = settingRouteFare(Routedata);
				scheduleArray.get(i).getAsJsonObject().addProperty("adultcharge", routeInfo.getNormalfare());
			}
		}
	}
	
}
