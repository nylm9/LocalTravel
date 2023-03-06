package com.localtravel.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.MenuDto;
import com.localtravel.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adsvc;
	
	@RequestMapping(value="/deleteAdminEnjoy")
	public ModelAndView deleteAdminEnjoy(String ecode, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("ecode : " + ecode);
		//likebtn 테이블 컬럼삭제
		int lbtnDelResult = adsvc.dellikebtn(ecode);
		//reivews 테이블 컬럼 삭제
		int reDelResult = adsvc.delReviews(ecode);
		//enjoy테이블에서 해당 놀거리 삭제
		int DelEnjoyResult = adsvc.delEnjoy(ecode);		
		if(DelEnjoyResult > 0) {
			System.out.println("enjoy 삭제성공");
			ra.addFlashAttribute("delEnjoySMsg", "놀거리 삭제 성공");
			mav.setViewName("redirect:/AdminDataPage");
		}
		return mav;
	}
	
	@RequestMapping(value="/deleteAdminMenu")
	public ModelAndView deleteAdminMenu(String fcode, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("fcode : " + fcode);
		int AdminMDelResult = adsvc.delMenu(fcode);
		if(AdminMDelResult > 0) {
			System.out.println("메뉴삭제 성공");
			int AdminFDelResult = adsvc.delFood(fcode);
			if(AdminFDelResult > 0) {
				System.out.println("가게삭제 성공");
				ra.addFlashAttribute("AdminDelSMsg", "삭제 성공");
				mav.setViewName("redirect:/AdminDataPage");
			} else {
				System.out.println("가게삭제 실패");
				ra.addFlashAttribute("AdminDelFMsg", "삭제 실패");
				mav.setViewName("redirect:/AdminDataPage");
			}
		} else {
			System.out.println("메뉴삭제 실패");
			ra.addFlashAttribute("AdminDelFMsg", "삭제 실패");
			mav.setViewName("redirect:/AdminDataPage");
		}
		
		
		return mav;
	}
	
	@RequestMapping(value="/testMemberJoinCheckForm")
	public ModelAndView testMemberJoinCheckForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberJoinCheckBox");
		return mav;
	}
	
	@RequestMapping(value="/testMainPage")
	public ModelAndView testMainPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/testMain");
		return mav;
	}
	
	@RequestMapping(value="/insertMenuData")
	public ModelAndView insertMenuData(MenuDto menu, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("Admin_메뉴 등록 기능 컨트롤러 호출");
		System.out.println(menu);
		int insertMResult = adsvc.insertMData(menu);
		if(insertMResult > 0) {
			System.out.println("메뉴 등록 성공");
			ra.addFlashAttribute("Msg", "메뉴 등록에 성공하였습니다.");
			mav.setViewName("admin/AdminPage");
		} else {
			System.out.println("메뉴 등록 실패");
			ra.addFlashAttribute("Msg", "메뉴 등록에 실패하였습니다.");
			mav.setViewName("admin/AdminPage");
			
		}
		return mav;
	}
	
	
	
	@RequestMapping(value="/insertFoodData")
	public ModelAndView insertFoodData(FoodDto food, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("Admin_가게 등록 기능 컨트롤러 호출");
		System.out.println(food);
		int insertFResult = adsvc.insertFData(food);
		if(insertFResult > 0) {
			System.out.println("가게 등록 성공");
			ra.addFlashAttribute("Msg", "가게 등록에 성공하였습니다.");
			String fcode = food.getFcode();
			mav.addObject("fcode",fcode);
			mav.setViewName("admin/AdminPage");
		} else {
			System.out.println("가게 등록 실패");
			ra.addFlashAttribute("Msg", "가게 등록에 실패하였습니다.");
			mav.setViewName("admin/AdminPage");
		}
		return mav;
 	}
	
	
	@RequestMapping(value="/insertEnjoyData")
	public ModelAndView insertEnjoyData(EnjoyDto enjoy, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("Admin_놀거리 등록 기능 호출");
		System.out.println(enjoy);
		int insertEResult = adsvc.insertEData(enjoy);
		if(insertEResult > 0) {
			System.out.println("놀거리 등록 성공");
			ra.addFlashAttribute("Msg", "놀거리 등록에 성공하였습니다.");
			
			mav.setViewName("admin/AdminPage");
		} else {
			System.out.println("놀거리 등록 실패");
			ra.addFlashAttribute("Msg", "놀거리 등록에 실패하였습니다.");
			mav.setViewName("admin/AdminPage");
		}
		return mav;
 	}
	
	@RequestMapping(value="/enjoyNameCheck")
	public @ResponseBody String enjoyNameCheck(String inputEname, String inputEaddr) {
		System.out.println("Ajax_놀거리 이름 중복체크");
		System.out.println("입력한 놀거리 이름 : " + inputEname);
		System.out.println("입력한 놀거리 이름 : " + inputEaddr);
		//1. 중복 확인 기능 호출
		String enjoyCheckResult = adsvc.enjoyCheck(inputEname, inputEaddr);
		//2. 중복확인 결과값 리턴
		return enjoyCheckResult;
	}
	
	@RequestMapping(value="/enjoyFoodCheck")
	public @ResponseBody String enjoyFoodCheck(String inputFname, String inputFaddr) {
		System.out.println("Ajax_가게 이름 중복체크");
		System.out.println("입력한 가게 이름 : " + inputFname);
		System.out.println("입력한 가게 이름 : " + inputFaddr);
		//1. 중복 확인 기능 호출
		String foodCheckResult = adsvc.foodCheck(inputFname, inputFaddr);
		//2. 중복확인 결과값 리턴
		return foodCheckResult;
	}
	
	@RequestMapping(value="/AdminPage")
	public ModelAndView AdminPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("관리자 페이지 이동");
		mav.setViewName("admin/AdminPage");
		return mav;
	}
	
	@RequestMapping(value="/AdminDataPage")
	public ModelAndView AdminDataPage() {
		ModelAndView mav = new ModelAndView();
		System.out.println("데이터 조회 페이지 이동");
		// Enjoy 데이터 모두 조회
		ArrayList<EnjoyDto> enjoyList = adsvc.getEnjoyData();
		// Food 데이터 모두 조회
		ArrayList<FoodDto> foodList = adsvc.getFoodData();
		mav.addObject("enjoyList",enjoyList);
		mav.addObject("foodList",foodList);
		mav.setViewName("admin/Admin_DataViewPage");
		return mav;
	}
	
	/* @PostMapping("/multi-file")
	public String multiFileUpload(@RequestParam("multiFile") List<MultipartFile> multiFileList, @RequestParam String fileContent, HttpServletRequest request) {
		
		// 받아온것 출력 확인
		System.out.println("multiFileList : " + multiFileList);
		System.out.println("fileContent : " + fileContent);
		
		// path 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources");
		String root = path + "\\" + "MenuPicture";
		
		File fileCheck = new File(root);
		
		if(!fileCheck.exists()) fileCheck.mkdirs();
		
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		
		
		// System.out.println(fileList);
		
		// 파일업로드
		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
			}
			
			System.out.println("다중 파일 업로드 성공!");
			
		} catch (IllegalStateException | IOException e) {
			System.out.println("다중 파일 업로드 실패");
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			
			
			e.printStackTrace();
		}
		
		
		
		return "admin/AdminPage";
	} */
  	
	@RequestMapping(value="/searchPopOpen")
	public String searchPopOpen() {
		System.out.println("가게코드 검색창 팝업 오픈");
		return "admin/searchPop";
	}
	
	@RequestMapping(value="/getAllFoodList")
	public @ResponseBody String getAllFoodList(String inputval) {
		System.out.println("Ajax_Food목록 조회");
		ArrayList<FoodDto> allFList = adsvc.getFoodList(inputval);
		System.out.println(allFList);
		return new Gson().toJson(allFList);
	}
	
	@RequestMapping(value="/MenuDataPopOpen")
	public ModelAndView ModelAndView(String selectFcode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("MenuDataPopUp_Menu목록 조회");
		ArrayList<MenuDto> selectFmenu = adsvc.getSelectFMenu(selectFcode);
		System.out.println(selectFmenu);
		mav.addObject("selectFmenu",selectFmenu);
		mav.setViewName("admin/menuDataPop");
		return mav;
	}
	
	
	
	
	
	
	
	
	
}
