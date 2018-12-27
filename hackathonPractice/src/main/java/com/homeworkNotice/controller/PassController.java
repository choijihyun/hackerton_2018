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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.homeworkNotice.dao.UserDao;
import com.homeworkNotice.dto.UserDto;
import com.homeworkNotice.dao.PassDao;
import com.homeworkNotice.dto.PassDto;
import com.homeworkNotice.dto.TeamDto;


@Controller
public class PassController {
	
	//싱글톤으로 떠도는 userDao를 잡아옴
 @Autowired //만약에 따로 정해진 id 가 있으면 autowired 아니라 다른거로 ㅎㅎㅎㅎ;;
 private PassDao passDao;

	@ResponseBody
   @RequestMapping(value = "/pass/insertPass.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)// value라는 값에 매핑, get방식 사용
   public String insertPass(
   			Model model,
   			@RequestParam(value = "year", required=true) final int year,
   			@RequestParam(value = "cutLine", required=true) final int cutLine,
   			@RequestParam(value = "passNum", required=true) final int passNum,
   			@RequestParam(value = "examNum", required=true) final int examNum
   			) { // 이렇게 5개의 파라미터를 받아오고 내용 안쓰면 x
		HashMap<Object, Object> param=new HashMap<Object, Object>(); //각각의 id마다 hashmap 만들어주니까 생성을 해줌
   			
		param.put("examNum",examNum);

		
		
		List<PassDto> passDtoList=passDao.getPass(param);
		
		param.put("year",year);		
		param.put("cutLine",cutLine);
		param.put("passNum",passNum);
		if(passDtoList.isEmpty())
			param.put("orderExam", 1);
		else param.put("orderExam", (int)passDtoList.get(0).getOrderExam()+1);
		
		
		int result=0;
		try {
			result=passDao.insertPass(param);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		JSONObject jSONObject = new JSONObject();
   	if(result==1) {
   		jSONObject.put("result", "1");//성공     		
   	}
   	else {
   		jSONObject.put("result", "0");
   	}
   	return jSONObject.toString();
	}


	
	@ResponseBody
	   @RequestMapping(value = "/pass/getPass.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)
	   public String getPass(
	   			Locale locale, 
	   			Model model,
	   			@RequestParam(value = "examNum", required=true) final int examNum
	   			) {

			HashMap<Object, Object> param=new HashMap<Object, Object>();
			
			param.put("examNum",examNum);
			
			
	   	List<PassDto> passDtoList=passDao.getPass(param);
	   	JSONArray jSONArray=new JSONArray();
	   	List<JSONObject> jsonList=new ArrayList<JSONObject>();
	       if(!passDtoList.isEmpty()) {//반환받은 데이터가 유효하면(db에 있으면) 브라우저 화면에 결과를 뿌려준다
	       	for(int i=0;i<passDtoList.size();i++) {
	       		JSONObject jSONObject = new JSONObject();
	       		jSONObject.put("auto",passDtoList.get(i).getAuto());
	       		jSONObject.put("year",passDtoList.get(i).getYear());
	       		jSONObject.put("orderExam", passDtoList.get(i).getOrderExam());
	       		jSONObject.put("cutLine", passDtoList.get(i).getCutLine());
	       		jSONObject.put("passNum", passDtoList.get(i).getPassNum());
	       		jSONObject.put("examNum", passDtoList.get(i).getExamNum());
	           		
	       		jSONArray.add(jSONObject);
	       		
	       		jsonList.add((JSONObject)jSONArray.get(i));
	       		
	       		System.out.println(jsonList);
	       	}
	       	
	       	System.out.println(jsonList);
	       	
	       	jSONArray.clear();
	       	for(int i=0;i<passDtoList.size();i++){
	       		jSONArray.add(jsonList.get(i));
	       	}
	       	
	       	JSONObject jsObject=new JSONObject();
	       	jsObject.put("result", jSONArray);

	           return jsObject.toString();
	       } 
	       else {//없으면 에러라고 브라우저에 뿌려준다

	   		JSONObject jSONObject = new JSONObject();
	       	jSONObject.put("result", "no data");
	       	
	       	return jSONObject.toString();
	       }
		}
	
	@ResponseBody
	   @RequestMapping(value = "/pass/getOrderExam.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)
	   public String getOrderExam(
	   			Locale locale, 
	   			Model model,
	   			@RequestParam(value = "examNum", required=true) final int examNum
	   			) {

			HashMap<Object, Object> param=new HashMap<Object, Object>();
			
			param.put("examNum",examNum);
			
			
	   	List<PassDto> passDtoList=passDao.getPass(param);
	   	JSONArray jSONArray=new JSONArray();
	   	List<JSONObject> jsonList=new ArrayList<JSONObject>();
	       if(!passDtoList.isEmpty()) {//반환받은 데이터가 유효하면(db에 있으면) 브라우저 화면에 결과를 뿌려준다
	       	for(int i=0;i<passDtoList.size();i++) {
	       		JSONObject jSONObject = new JSONObject();
	       		jSONObject.put("auto",passDtoList.get(i).getAuto());
	       		jSONObject.put("year",passDtoList.get(i).getYear());
	       		jSONObject.put("orderExam", passDtoList.get(i).getOrderExam());
	       		jSONObject.put("cutLine", passDtoList.get(i).getCutLine());
	       		jSONObject.put("passNum", passDtoList.get(i).getPassNum());
	       		jSONObject.put("examNum", passDtoList.get(i).getExamNum());
	           		
	       		jSONArray.add(jSONObject);
	       		
	       		jsonList.add((JSONObject)jSONArray.get(i));
	       		
	       		System.out.println(jsonList);
	       	}
	       	
	       	System.out.println(jsonList);
	       	
	       	jSONArray.clear();
	       	for(int i=0;i<passDtoList.size();i++){
	       		jSONArray.add(jsonList.get(i));
	       	}
	       	
	       	JSONObject jsObject=new JSONObject();
	       	jsObject.put("result", jSONArray);

	           return jsObject.toString();
	       } 
	       else {//없으면 에러라고 브라우저에 뿌려준다

	   		JSONObject jSONObject = new JSONObject();
	       	jSONObject.put("result", "no data");
	       	
	       	return jSONObject.toString();
	       }
		}
	
	
		
}