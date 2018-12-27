package com.homeworkNotice.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.homeworkNotice.dao.UserDao;
import com.homeworkNotice.dto.UserDto;
import com.homeworkNotice.dao.StudentDao;
import com.homeworkNotice.dto.StudentDto;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

@Controller
public class StudentController {

	 @Autowired
	 private StudentDao studentDao;
	
	 
	 @ResponseBody
	    @RequestMapping(value = "/student/insertExcel.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.POST)// value라는 값에 매핑, get방식 사용
	    public String insertExcel(
	    		MultipartFile testFile, MultipartHttpServletRequest request) { // 이렇게 5개의 파라미터를 받아오고 내용 안쓰면 x

		    System.out.println("업로드 진행");

		    MultipartFile excelFile = request.getFile("excelFile");

		    if(excelFile==null || excelFile.isEmpty()){

		        throw new RuntimeException("엑셀파일을 선택 해 주세요.");
		    }

		    File destFile = new File("C:\\"+excelFile.getOriginalFilename());

		    try{
		      //내가 설정한 위치에 내가 올린 파일을 만들고
		        excelFile.transferTo(destFile);

		    }catch(Exception e){
		        throw new RuntimeException(e.getMessage(),e);
		    }

		    ExcelReadOption excelReadOption = new ExcelReadOption();

//			파일경로 추가
	        excelReadOption.setFilePath(destFile.getAbsolutePath());
//	      추출할 컬럼 명 추가
	        excelReadOption.setOutputColumns("Department","UserID","Name","Total","문제1","문제2","문제3","문제4","문제5","문제6","문제7","문제8","문제9","문제10","문제11","문제12","문제13","문제14","문제15","문제16","문제17","문제18");
	        // 시작 행
	        excelReadOption.setStartRow(2);

	        List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);

	        HashMap<Object, Object> param=new HashMap<Object, Object>(); //각각의 id마다 hashmap 만들어주니까 생성을 해줌
	    	param.put("excelContent", excelContent);
	    	
	        try {
	      studentDao.insertExcel(param);
	    } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
		    destFile.delete();
		  //		FileUtils.delete(destFile.getAbsolutePath());

		    int result=0;
			JSONObject jSONObject = new JSONObject();
	    	if(result==1) {
	    		jSONObject.put("result", "1");//성공     		
	    	}
	    	else {
	    		jSONObject.put("result", "0");
	    	}
	    	return jSONObject.toString();
		}
}
