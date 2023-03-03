package com.localtravel.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.localtravel.dao.TrainDao;
import com.localtravel.dto.MemberDto;
import com.localtravel.dto.ReservationDto;
import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.dto.TRInputScheduleDto;
import com.localtravel.dto.TRSeatDto;
import com.localtravel.dto.TRServeDto;
import com.localtravel.dto.TRStationDto;

@Service
public class TrainReserveService {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	TrainDao trdao;

	@Autowired
	TrainService trsvc;

	public ArrayList<TRCityCodeDto> getCityList() {
		ArrayList<TRCityCodeDto> cityList = trdao.selectCityList();
		return cityList;
	}

	// 처음 역을 선택 할 시 출력될 기능
	public String getStationList(String citycode) {
		JsonArray jsonArray = new JsonArray();
		ArrayList<TRStationDto> staList = trdao.selectStaList(citycode);
		Gson gson = new Gson();
		for (int i = 0; i < staList.size(); i++) {
			JsonObject obj = new JsonObject();
			obj.addProperty("citycode", citycode);
			obj.addProperty("nodeid", staList.get(i).getNodeid());
			obj.addProperty("nodename", staList.get(i).getNodename());
			jsonArray.add(obj);

		}

		return gson.toJson(jsonArray);
	}

	// 다음 역을 선택 할 시 출력될 기능
	public String getArrStationList(String nodename) {
		JsonArray jsonArray = new JsonArray();
		ArrayList<TRStationDto> staList = trdao.selectArrStaion(nodename);
		Gson gson = new Gson();
		for (int i = 0; i < staList.size(); i++) {
			JsonObject obj = new JsonObject();
			obj.addProperty("citycode", staList.get(i).getNocitycode());
			obj.addProperty("nodeid", staList.get(i).getNodeid());
			obj.addProperty("nodename", staList.get(i).getNodename());
			jsonArray.add(obj);

		}
		return gson.toJson(jsonArray);
	}

	public String searchTRSchedule(TRInputScheduleDto scheduleInfo) throws Exception {
		// 날짜 입력기
		String InputDate = scheduleInfo.getDepPlandTime().replace("-", "");
		System.out.println("변환된 날짜값 : " + InputDate);
		scheduleInfo.setDepPlandTime(InputDate);
		System.out.println(scheduleInfo);
		// API를 통해 열차 시간을 불러온다.
		String ScheduleList = trsvc.searchSchedule(scheduleInfo);

		return ScheduleList;
	}

	public ArrayList<TRSeatDto> seatSelect() {

		ArrayList<TRSeatDto> seatList = trdao.selectSeatInfo();

		return seatList;
	}

	// 좌석정보 가져오기
	public String getFirstSeatData() {
		ArrayList<TRSeatDto> seatList = trdao.selectSeatInfo();
		JsonArray jsonArray = new JsonArray();
		Gson gson = new Gson();
		for (int i = 0; i < seatList.size(); i++) {
			JsonObject obj = new JsonObject();
			obj.addProperty("car", seatList.get(i).getCar());
			obj.addProperty("nscode", seatList.get(i).getNscode());
			obj.addProperty("seatnum", seatList.get(i).getSeatnum());
			jsonArray.add(obj);

		}

		return gson.toJson(jsonArray);
	}

	public String getInputSeatData(String carNum) {
		// 8호차 배치가 이상한 관계로 변형
		if (carNum.equals("8")) {
			carNum = "5";
		}
		ArrayList<TRSeatDto> seatList = trdao.selectSeatInput(carNum);
		JsonArray jsonArray = new JsonArray();
		Gson gson = new Gson();
		for (int i = 0; i < seatList.size(); i++) {
			JsonObject obj = new JsonObject();
			obj.addProperty("car", seatList.get(i).getCar());
			obj.addProperty("nscode", seatList.get(i).getNscode());
			obj.addProperty("seatnum", seatList.get(i).getSeatnum());
			jsonArray.add(obj);

		}
		return gson.toJson(jsonArray);
	}

	public ReservationDto reservationAdd(TRServeDto reserveData) {
		
		ReservationDto reservationData = new ReservationDto();
		String sessionLoginId = (String)session.getAttribute("loginId");
		// 예매코드만들기
		String reservationCode = "T";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String formattedDate = sdf.format(date);
		String dateCode = formattedDate.substring(2);

		Random random = new Random();
		int num = (int)(Math.random() * 900) + 100;

		reservationCode = reservationCode + dateCode + num;
		System.out.println(reservationCode);
		reservationData.setRecode(reservationCode);
		reservationData.setRemid(sessionLoginId);
		reservationData.setDepsta(reserveData.getDepSta());
		reservationData.setDeptime(reserveData.getDeptime());
		reservationData.setArrsta(reserveData.getArrSta());
		reservationData.setArrtime(reserveData.getArrtime());
		reservationData.setTrainno(reserveData.getTrainNo());
		reservationData.setCarnum(reserveData.getCarNum());
		reservationData.setSeatnum(reserveData.getSeatNum());
		reservationData.setTraindate(reserveData.getReserveDate());
		reservationData.setRedate("");
		reservationData.setCharge(reserveData.getAdultCharge());
		System.out.println("입력 직전 결과 : "+reservationData);
		
		
		trdao.insertReservationCode(reservationData);
		
		return reservationData;
	}

	public MemberDto getMemberInfo(String loginId) {
		
		MemberDto memInfo = trdao.getMemberInfo(loginId);
		
		return memInfo;
	}

	public String getResevedSeat(String reserveDate, String trainno, String carNum) {
		System.out.println("예약된 좌석 확인 - SERVICE");
		// 정렬해 줄 좌석정보
		ArrayList<String> replaceSeat1 = new ArrayList<String>();
		String replaceSeat = "";
		// 가져올 좌석 정보
		ArrayList<String> ResevedSeat = new ArrayList<String>();
		ResevedSeat = trdao.getgetResevedSeat(reserveDate,trainno,carNum);
//		System.out.println(ResevedSeat.get(0));
		for(int i = 0; i < ResevedSeat.size(); i++) {
			replaceSeat += ResevedSeat.get(i);
			if(i < ResevedSeat.size()-1) {
				replaceSeat += ",";
			}
		}
		System.out.println(replaceSeat);
		return replaceSeat;
	}

}
