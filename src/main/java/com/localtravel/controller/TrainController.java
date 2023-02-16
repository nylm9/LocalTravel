package com.localtravel.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localtravel.dto.TRInputScheduleDto;
import com.localtravel.dto.TRSeatDto;
import com.localtravel.service.TrainReserveService;
import com.localtravel.service.TrainService;

@Controller
public class TrainController {

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

//		System.out.println(scheduleList);
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
	
	@RequestMapping(value = "/TestPayment")
	public ModelAndView TestPayment() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("reserve/paymentPage");
		return mav;
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
