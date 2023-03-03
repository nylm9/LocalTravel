package com.localtravel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localtravel.dto.TRCityCodeDto;
import com.localtravel.dto.TRInputScheduleDto;
import com.localtravel.dto.TRSeatDto;
import com.localtravel.service.TrainReserveService;
import com.localtravel.service.TrainService;

@Controller
public class TrainController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	TrainService trsvc;

	@Autowired
	TrainReserveService treser;
	
	

	// 열차-도시코드 가져오기
	@RequestMapping(value = "/getCityCodeInfo")
	public ModelAndView getCityCodeInfo() throws Exception {
		System.out.println("TrainController - 열차 도시코드 가져오기");

		int insertReult = trsvc.getCityCodeInfo();

		return null;
	}

	// 열차 - 역코드 가져오기
	@RequestMapping(value = "/getStationInfo")
	public ModelAndView getStationInfo() throws Exception {
		System.out.println("TrainController - 열차 역코드 가져오기");

		int insertReult = trsvc.getStaionCodeInfo();

		return null;
	}

	// 열차 - 좌석코드 가져오기
	@RequestMapping(value = "/getSeatInfo")
	public ModelAndView getSeatInfo() throws Exception {
		System.out.println("TrainController - 열차 역코드 가져오기");

		int insertReult = trsvc.getSeatInfo();

		return null;
	}

	// 열차시간정보 가져오기 RequestData( 출발역, 도착역, YYYY-MM-DD )
	@RequestMapping(value = "/getTrainSchedule")
	public @ResponseBody String getTrainSchedule(TRInputScheduleDto inputSchedule, RedirectAttributes ra)
			throws Exception {
		String scheduleList = "";
		System.out.println("Controller - getTrainSchedule()");
		System.out.println(inputSchedule);
		System.out.println("=".repeat(50));

		try {
			scheduleList = trsvc.searchSchedule(inputSchedule);
		} catch (Exception IllegalStateException) {
			System.out.println("해당 노선을 찾을 수 없습니다.");
			System.out.println(IllegalStateException);
			ra.addFlashAttribute("redirectMsg", "회원가입 되었습니다.");
			ra.addFlashAttribute("redirect", "TestSchedule");
		}

		System.out.println(scheduleList);
		return scheduleList;
	}

	/* 열차 예매 관련 컨트롤러 */

	// // 출발 :: 지역 선택 -> 역 출력
	@RequestMapping(value = "/DepRegionSelect")
	public @ResponseBody String DepRegionSelect(String citycode) {
		System.out.println(citycode);
		String stationList = treser.getStationList(citycode);
		System.out.println(stationList);
		return stationList;
	}

	// 출발 :: 역 선택 -> 도착역 정보 출력
	@RequestMapping(value = "/DepStationSelect")
	public @ResponseBody String DepStationSelect(String nodename) {
		System.out.println("선택한 역 이름 : " + nodename);
		String arrStaList = treser.getArrStationList(nodename);
		System.err.println("도착할 역 정보 : ");
		System.out.println(arrStaList);
		return arrStaList;
	}

	// 도착 :: 역 선택 -> 도착역 정보 출력
	@RequestMapping(value = "/ArrStationSelect")
	public @ResponseBody String ArrStationSelect(String nodename) {
		System.out.println("선택한 역 이름 : " + nodename);
		String arrStaList = treser.getArrStationList(nodename);
		System.err.println("도착할 역 정보 : ");
		System.out.println(arrStaList);
		return arrStaList;
	}

	// 공통 :: 날짜입력후 열차스케줄 체크
	@RequestMapping(value = "/searchTRSchedule")
	public @ResponseBody String searchTRSchedule(TRInputScheduleDto scheduleInfo) throws Exception {
		System.out.println(scheduleInfo);
		String scheduleList = treser.searchTRSchedule(scheduleInfo);
		System.out.println(scheduleList);
		return scheduleList;
	}

	// 좌석 선택부분
	@RequestMapping(value = "/SeatSelect")
	public ModelAndView SeatSelect() throws Exception {
		System.out.println("TrainController - 열차 좌석 정보 가져오기");
		ModelAndView mav = new ModelAndView();
		ArrayList<TRSeatDto> seatList = treser.seatSelect();
		mav.addObject("seatList", seatList);
		mav.setViewName("reserve/seatSelect");
		return mav;
	}

	// 좌석 정보 가져오기 - 처음
	@RequestMapping(value = "/getSeatData")
	public @ResponseBody String getSeatData() throws Exception {
		String seatList = treser.getFirstSeatData();
//		System.out.println(seatList);
		return seatList;
	}

	// 좌석정보 가져오기 - 입력값
	@RequestMapping(value = "/getSeatData2")
	public @ResponseBody String getSeatData2(String carNum) throws Exception {
		System.out.println(carNum);
		String seatList = treser.getInputSeatData(carNum);
		System.out.println(seatList);
		return seatList;
	}
	// 이미 예매된 좌석정보 가져오기 - getResevedSeat
	@RequestMapping(value = "/getResevedSeat")
	public @ResponseBody String getResevedSeat(String reserveDate, String Trainno, String carNum){
		System.out.println("예매된 좌석 출력하기 : "+reserveDate +","+Trainno+","+carNum);
		String reservedseatList = treser.getResevedSeat(reserveDate,Trainno,carNum); 
		return reservedseatList;
	}
	
	// 상세페이지에서 바로 예매하기 
	@RequestMapping(value="/locationSelectReservePage")
	public ModelAndView locationSelectReservePage(String elcode,RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("지역코드 : "+ elcode);
		String LocationNum = elcode;
		System.out.println("예약페이지 이동");
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
			//로그인이 되지 않은 상태
			mav.setViewName("redirect:/memberLoginForm");
			ra.addFlashAttribute("loginMsg","로그인 후 이용가능한 서비스입니다.");
		} else {
			// 로그인이 되어있는 상태
			ArrayList<TRCityCodeDto> cityList = treser.getCityList();
			System.out.println(cityList);
			mav.addObject("cityList",cityList);
			mav.addObject("LocationSelect",LocationNum);
			mav.setViewName("reserve/projectreserve");
		}
		return mav;
	}
	
	// 예매 취소하기
	@RequestMapping(value = "/cancelReservation")
	public ModelAndView cancelReservation(String recode) {
		System.out.println("TrainController - 예매 취소하기");

		int insertReult = trsvc.cancelReservation(recode);

		return null;
	}
	
	
	
	

	// 테스트 - 역 스케줄 입력 및 출력 페이지 이동
	@RequestMapping(value = "/TestSchedule")
	public ModelAndView TestSchedule() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("testPage/TestSchedule");
		return mav;
	}

	// 테스트 - CSV파일 가져오기
	@RequestMapping(value = "/TestCSVfile")
	public ModelAndView TestCSVfile() {

		trsvc.fareCsv();

		return null;
	}

}
