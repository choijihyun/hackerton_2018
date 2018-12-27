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
import com.homeworkNotice.dao.SubjectDao;
import com.homeworkNotice.dto.SubjectDto;
import com.homeworkNotice.dto.TeamDto;
import com.homeworkNotice.dao.CompleteDao;
import com.homeworkNotice.dto.CompleteDto;
import com.homeworkNotice.dao.TimeTableDao;
import com.homeworkNotice.dto.TimeTableDto;
import com.homeworkNotice.dao.HomeworkDao;
import com.homeworkNotice.dto.HomeworkDto;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

@Controller
public class PassController {
	
	//싱글톤으로 떠도는 userDao를 잡아옴
 @Autowired //만약에 따로 정해진 id 가 있으면 autowired 아니라 다른거로 ㅎㅎㅎㅎ;;
 private UserDao userDao;
 private SubjectDao subjectDao;
 private CompleteDao completeDao;
 private TimeTableDao timeTableDao;
 private HomeworkDao homeworkDao;
 

	@ResponseBody
   @RequestMapping(value = "/user/insertUser.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)// value라는 값에 매핑, get방식 사용
   public String insertUser(
   			Model model,
   			@RequestParam(value = "id", required=true) String id,
   			@RequestParam(value = "pw", required=true) String pw,
   			@RequestParam(value = "name", required=true) String name) { // 이렇게 5개의 파라미터를 받아오고 내용 안쓰면 x
		HashMap<Object, Object> param=new HashMap<Object, Object>(); //각각의 id마다 hashmap 만들어주니까 생성을 해줌
   			
		param.put("id",id);		
		param.put("pw",pw);		
		param.put("name",name);		

		int result=0;
		try {
			result=userDao.insertUser(param);
			
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

	//이거는 처음 로그인 할때만 쓰는 controller
	@RequestMapping(value = "/user/checkUser.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.POST)//요 부분이 url //get방식으로 저 /user/getUserPwdInfo.json이라는 url로 들어와서 값을 확인 할 수 있다.
	public @ResponseBody String checkUser(//url에 맵핑(연결)된 함수
			HttpSession session,
			Locale locale, //안드로이드에서 받을 파라미터
			Model model, //안드로이드에서 받을 파라미터
			@RequestParam(value = "id", required=true) String id,
			@RequestParam(value = "pw", required=true) String pw) {
		int result=0;
		
		HashMap<Object, Object> param=new HashMap<Object, Object>();
		
		param.put("id",id);
		param.put("pw",pw);
		
		
		System.out.println(param);
		List<UserDto> userDtoList=userDao.selectUser(param);
	
		
		JSONObject jSONObject = new JSONObject();
		if(!userDtoList.isEmpty() && userDtoList.size()==1) {//반환받은 데이터가 유효하면(db에 있으면) 브라우저 화면에 결과를 뿌려준다
			if(pw.equals(userDtoList.get(0).getPw())) {
				jSONObject.put("result","1");//id도 존재하고 비번도 맞는 경우
				String name = userDtoList.get(0).getName();
				session.setAttribute("name", name);
			}
		}
		else {//없으면 에러라고 브라우저에 뿌려준다
			jSONObject.put("result", "0"); //id가 존재하지 않는경우
		}
		//System.out.println(jSONObject.toString());
		return jSONObject.toString();//요청한 내용들을 반환해준다.
	}
	
	@ResponseBody
   @RequestMapping(value = "/user/getAllUserData.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)
   public String getAllUserData(
   			Locale locale, 
   			Model model,
   			@RequestParam(value = "select", required=true) final int select) {

   	List<UserDto> userDtoList=userDao.selectAllList();
   	System.out.println(userDtoList);
   	JSONArray jSONArray=new JSONArray();
   	List<JSONObject> jsonList=new ArrayList<JSONObject>();
       if(!userDtoList.isEmpty()) {//반환받은 데이터가 유효하면(db에 있으면) 브라우저 화면에 결과를 뿌려준다
       	for(int i=0;i<userDtoList.size();i++) {
       		JSONObject jSONObject = new JSONObject();
       		jSONObject.put("id",userDtoList.get(i).getId());
       		jSONObject.put("pw", userDtoList.get(i).getPw());
       		jSONObject.put("name", userDtoList.get(i).getName());
       		
       		jSONArray.add(jSONObject);
       		
       		jsonList.add((JSONObject)jSONArray.get(i));
       		
       		System.out.println(jsonList);
       	}
       	
       	System.out.println(jsonList);
       	
       	jSONArray.clear();
       	for(int i=0;i<userDtoList.size();i++){
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
   @RequestMapping(value = "/user/deleteUser.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)// value라는 값에 매핑, get방식 사용
   public String deleteUser(
   			Model model,
   			@RequestParam(value = "id", required=true) String id) { // 이렇게 5개의 파라미터를 받아오고 내용 안쓰면 x
		HashMap<Object, Object> param=new HashMap<Object, Object>(); //각각의 id마다 hashmap 만들어주니까 생성을 해줌
   			
		param.put("id",id);	
		//
		System.out.println(param);
		
		
		//이 함수(url)은 회원가입이 주 목적이기 때문에
		//결과로 성공 or 실패만 알려 주면 돼
		//int 값으로 반환이 되는데 1이면 성공 나머지 값이면 실패!!
		int result=0,result1=0,result2=0,result3=0,result4=0;
		try {
			result=userDao.deleteUser(param);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		System.out.println(result);
   	JSONObject jSONObject = new JSONObject();
   	//그래서 여기서 성공 or 실패 구분해서 안드로이드에 json 데이터를 결과로 전달해줄거야
   	if(result==1/*&&result1==1&&result2==1&&result3==1&&result4==1*/) {
   		jSONObject.put("result", "1");//성공     		
   	}
   	else {
   		jSONObject.put("result", "0");
   	}
   	return jSONObject.toString();
	}
	
		/*
		@ResponseBody
	    @RequestMapping(value = "/user/checkbox.json", produces="application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)
	    public String checkbox(
	    			Locale locale, 
	    			Model model,
	    			@RequestParam(value = "select", required=true) final int select,
	    			@RequestParam(value = "stuId", required=true) String stuId) {
			HashMap<Object, Object> param=new HashMap<Object, Object>();	
			param.put("stuId",stuId);
			param.put("check", select);
			
			int result=0;
			try {
				result=userDao.checkbox(param);
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}

	    	JSONObject jSONObject = new JSONObject();
	    	//그래서 여기서 성공 or 실패 구분해서 안드로이드에 json 데이터를 결과로 전달해줄거야
	    	if(result==1) {
	    		jSONObject.put("result", "1");//성공     		
	    	}
	    	else {
	    		jSONObject.put("result", "0");
	    	}
	    	return jSONObject.toString();
		}
		*/
			
	
		
}