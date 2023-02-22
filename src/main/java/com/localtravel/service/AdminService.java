package com.localtravel.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.localtravel.dao.AdminDao;
import com.localtravel.dto.EnjoyDto;
import com.localtravel.dto.FoodDto;
import com.localtravel.dto.MenuDto;

@Service
public class AdminService {

	@Autowired
	private ServletContext context;
	
	@Autowired
	private AdminDao adao;
	
	public int insertEData(EnjoyDto enjoy) throws IllegalStateException, IOException {
		System.out.println("Admin_Enjoy데이터 삽입 서비스 호출");
		//enjoy E 코드 생성 "E001", "E002", "E003"......;
		//1. 영화코드 최대값 조회
		String maxEcode = adao.selectMaxEcode();
		System.out.println("놀거리 코드 최대값 : " + maxEcode); 
		String ecode = "E";
		if(maxEcode == null) { // 놀거리코드 : "E001" 코드 생성
			ecode = ecode + String.format("%03d", 1);
		} else { // 최대값 + 1 코드 생성
			int ecodeNum = Integer.parseInt( maxEcode.replace("E", "") ) + 1;
			//maxMvcode : "MV005"
			//maxMvcode.replace("MV", "") : "005";
			//Integer.parseInt( "005" ); : INT값 5
			// 5 + 1 :: 6
			ecode = ecode + String.format("%03d", ecodeNum);
		}
		System.out.println("놀거리코드 : " +ecode);
		enjoy.setEcode(ecode);
		
		
//		1. 파일명 확인
		MultipartFile efile = enjoy.getEfile();
		String epicture = "";
		if(efile.isEmpty()) { 	// efile이 null이면 true 
			// 놀거리 파일을 업로드 하지 않은 경우
			System.out.println("첨부파일 없음");
		} else {
			// 놀거리 파일을 업로드 했을 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			epicture = uuid.toString() + "_" + efile.getOriginalFilename();
			// UUID : 총 32자리 임의의 코드를 만들어주는 역할
			String savePath = context.getRealPath("resources\\EnjoyPicture");
			System.out.println(savePath);
//			2. 파일을 저장 
			//1. 파일을 저장할 경로 
			//2. 파일저장기능 호출
			File file = new File(savePath,epicture);
			efile.transferTo(file);
		}
		System.out.println("epicture : " + epicture);
		//첨부파일이 없을 경우 :: mprofile : 
		//첨부파일이 있을 경우 :: 32자리코드 + 첨부파일명
		enjoy.setEpicture(epicture);
		int joinResult = 0;
		try {
			joinResult = adao.insertEdata(enjoy);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(joinResult);
		return joinResult;
	}

	public String enjoyCheck(String inputEname, String inputEaddr) {
		System.out.println("Ajax_놀거리 중복체크 서비스 호출");
		String eCheckResult = "NO";
		//중복 확인 
		ArrayList<Map<String, String>> enjoyEcode = adao.enjoyCheck(inputEname, inputEaddr);
		System.out.println(enjoyEcode.size());
		
		if(enjoyEcode.size() == 0) {
			eCheckResult = "OK";
			System.out.println(eCheckResult);
		}
		return eCheckResult;
	}
	
	public String foodCheck(String inputFname, String inputFaddr) {
		System.out.println("Ajax_가게 중복체크 서비스 호출");
		String fCheckResult = "NO";
		//중복 확인 
		ArrayList<Map<String, String>> foodFcode = adao.foodCheck(inputFname, inputFaddr);
		System.out.println(foodFcode.size());
		
		if(foodFcode.size() == 0) {
			fCheckResult = "OK";
			System.out.println(fCheckResult);
		}
		return fCheckResult;
	}

	
	public ArrayList<EnjoyDto> getEnjoyData() {
		System.out.println("Admin_Enjoy데이터 조회 서비스");
		ArrayList<EnjoyDto> eDataList = adao.selectEnjoyList();
		return eDataList;
	}

	
	public int insertFData(FoodDto food) throws IllegalStateException, IOException {
		System.out.println("Admin_Food데이터 삽입 서비스");
			System.out.println("f1ex : " + food.getF1ex());
		//Food F 코드 생성 "F001", "F002", "F003"......;
				//1. Food코드 최대값 조회
				String maxFcode = adao.selectMaxFcode();
				System.out.println("가게 코드 최대값 : " + maxFcode); 
				String fcode = "F";
				if(maxFcode == null) { // 가게코드 : "F001" 코드 생성
					fcode = fcode + String.format("%03d", 1);
				} else { // 최대값 + 1 코드 생성
					int fcodeNum = Integer.parseInt( maxFcode.replace("F", "") ) + 1;
					//maxFcode : "F005"
					//maxFcode.replace("F", "") : "005";
					//Integer.parseInt( "005" ); : INT값 5
					// 5 + 1 :: 6
					fcode = fcode + String.format("%03d", fcodeNum);
				}
				System.out.println("가게코드 : " +fcode);
				food.setFcode(fcode);
				
//				1. 파일명 확인
				MultipartFile ffile = food.getFfile();
				String fpicture = "";
				if(ffile.isEmpty()) { 	// ffile이 null이면 true 
					// 가게 파일을 업로드 하지 않은 경우
					System.out.println("첨부파일 없음");
				} else {
					// 가게 파일을 업로드 했을 경우
					System.out.println("첨부파일 있음");
					UUID uuid = UUID.randomUUID();
					fpicture = uuid.toString() + "_" + ffile.getOriginalFilename();
					// UUID : 총 32자리 임의의 코드를 만들어주는 역할
					String savePath = context.getRealPath("resources\\FoodPicture");
					System.out.println(savePath);
//					2. 파일을 저장 
					//1. 파일을 저장할 경로 
					//2. 파일저장기능 호출
					File file = new File(savePath,fpicture);
					ffile.transferTo(file);
				}
				System.out.println("epicture : " + fpicture);
				//첨부파일이 없을 경우 :: mprofile : 
				//첨부파일이 있을 경우 :: 32자리코드 + 첨부파일명
				food.setFpicture(fpicture);
				int joinResult = 0;
				try {
					joinResult = adao.insertFdata(food);
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println(joinResult);
				return joinResult;
			}

	public ArrayList<FoodDto> getFoodList(String inputval) {
		System.out.println("food 목록 조회");
		ArrayList<FoodDto> fList = adao.selectAllFoodList(inputval);
		System.out.println("fList : " + fList);
		return fList;
	}

	
	public int insertMData(MenuDto menu) throws IllegalStateException, IOException {
		System.out.println("Admin_Menu데이터 삽입 서비스");
		
		// 대표메뉴1 사진 업로드 과정
//		1. 파일명 확인
		MultipartFile mfile1 = menu.getMfile1();
		String mpicture1 = "";
		if(mfile1.isEmpty()) { 	// ffile이 null이면 true 
			// 가게 파일을 업로드 하지 않은 경우
			System.out.println("첨부파일 없음");
		} else {
			// 가게 파일을 업로드 했을 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			mpicture1 = uuid.toString() + "_" + mfile1.getOriginalFilename();
			// UUID : 총 32자리 임의의 코드를 만들어주는 역할
			String savePath = context.getRealPath("resources\\FoodPicture");
			System.out.println(savePath);
//			2. 파일을 저장 
			//1. 파일을 저장할 경로 
			//2. 파일저장기능 호출
			File file1 = new File(savePath,mpicture1);
			mfile1.transferTo(file1);
		}
		System.out.println("mpicture1 : " + mpicture1);
		//첨부파일이 없을 경우 :: mprofile : 
		//첨부파일이 있을 경우 :: 32자리코드 + 첨부파일명
		menu.setMpicture1(mpicture1);

		// 대표메뉴2 사진 업로드 과정
//		1. 파일명 확인
		MultipartFile mfile2 = menu.getMfile2();
		String mpicture2 = "";
		if(mfile2.isEmpty()) { 	// ffile이 null이면 true 
			// 가게 파일을 업로드 하지 않은 경우
			System.out.println("첨부파일 없음");
		} else {
			// 가게 파일을 업로드 했을 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			mpicture2 = uuid.toString() + "_" + mfile2.getOriginalFilename();
			// UUID : 총 32자리 임의의 코드를 만들어주는 역할
			String savePath = context.getRealPath("resources\\FoodPicture");
			System.out.println(savePath);
//			2. 파일을 저장 
			//1. 파일을 저장할 경로 
			//2. 파일저장기능 호출
			File file2 = new File(savePath,mpicture2);
			mfile2.transferTo(file2);
		}
		System.out.println("mpicture2 : " + mpicture2);
		//첨부파일이 없을 경우 :: mprofile : 
		//첨부파일이 있을 경우 :: 32자리코드 + 첨부파일명
		menu.setMpicture2(mpicture2);
		
		// 대표메뉴3 사진 업로드 과정
//		1. 파일명 확인
		MultipartFile mfile3 = menu.getMfile3();
		String mpicture3 = "";
		if(mfile3.isEmpty()) { 	// ffile이 null이면 true 
			// 가게 파일을 업로드 하지 않은 경우
			System.out.println("첨부파일 없음");
		} else {
			// 가게 파일을 업로드 했을 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			mpicture3 = uuid.toString() + "_" + mfile3.getOriginalFilename();
			// UUID : 총 32자리 임의의 코드를 만들어주는 역할
			String savePath = context.getRealPath("resources\\FoodPicture");
			System.out.println(savePath);
//			2. 파일을 저장 
			//1. 파일을 저장할 경로 
			//2. 파일저장기능 호출
			File file3 = new File(savePath,mpicture3);
			mfile3.transferTo(file3);
		}
		System.out.println("mpicture3 : " + mpicture3);
		//첨부파일이 없을 경우 :: mprofile : 
		//첨부파일이 있을 경우 :: 32자리코드 + 첨부파일명
		menu.setMpicture3(mpicture3);
		System.out.println("menu" + menu);
		// 최종 insert 부분
		int joinResult = 0;
		try {
			joinResult = adao.insertMdata(menu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(joinResult);
		return joinResult;
	}

	public ArrayList<FoodDto> getFoodData() {
		ArrayList<FoodDto> fList = adao.selectFoodList();
		return fList;
	}

	public ArrayList<MenuDto> getSelectFMenu(String selectFcode) {
		ArrayList<MenuDto> selectFoodMenu = adao.selectFoodMenu(selectFcode);
		return selectFoodMenu;
	}
	
	


	
	

}
