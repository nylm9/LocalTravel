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

@Service
public class AdminService {

	@Autowired
	private ServletContext context;
	
	@Autowired
	private AdminDao adao;
	
	public int insertEData(EnjoyDto enjoy) throws IllegalStateException, IOException {
		System.out.println("Admin_Enjoy데이터 입력 서비스 호출");
		//영화 코드 생성 "E001", "E002", "E003"......;
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
		String eCheckResult = "OK";
		//중복 확인 
		ArrayList<Map<String, String>> enjoyEcode = adao.enjoyCheck(inputEname, inputEaddr);
		
		if(enjoyEcode != null) {
			eCheckResult = "NO";
		}
		return eCheckResult;
	}

	
	

}
