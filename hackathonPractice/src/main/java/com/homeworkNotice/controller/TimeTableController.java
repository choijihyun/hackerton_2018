package com.homeworkNotice.controller;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.homeworkNotice.dao.SubjectDao;
import com.homeworkNotice.dto.SubjectDto;
import com.homeworkNotice.dao.UserDao;
import com.homeworkNotice.dao.TimeTableDao;
import com.homeworkNotice.dto.TimeTableDto;
import com.homeworkNotice.dto.UserDto;

@Controller
public class TimeTableController {

	@Autowired
	private TimeTableDao timeTableDao;

	@ResponseBody
	@RequestMapping(value = "/timeTable/getPassNum", produces = "application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)
	public String getPassNum(Locale locale, Model model,
			@RequestParam(value = "department", required = true) String department,
			@RequestParam(value = "total", required = true) String total) {
		HashMap<Object, Object> param = new HashMap<Object, Object>();
		int i = Integer.parseInt(total) + 1;
		i*=13;
		param.put("department", department);
		param.put("total", i);

		
		List<UserDto> userDtoList=timetableDao.getNum(param);
		int result = 0;
		try {
			result = timeTableDao.getPassNum(param);

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		System.out.println(result);
		JSONObject jSONObject = new JSONObject();

		if (result != 0) {
			jSONObject.put("passNum", result);
		} else {
			jSONObject.put("result", "0");
		}

		return jSONObject.toString();

	}

	@ResponseBody
	@RequestMapping(value = "/timeTable/getNum", produces = "application/json;text/plain;charset=UTF-8", method = RequestMethod.GET)
	public String getNum(Locale locale, Model model,
			@RequestParam(value = "department", required = true) String department) {

		HashMap<Object, Object> param = new HashMap<Object, Object>();

		param.put("department", department);

		List<UserDto> timeTableDtoList=TimeTableDto.getNum(param);
		
		System.out.println(result);
		JSONObject jSONObject = new JSONObject();

		if (result != 0) {
			jSONObject.put("Num", result);
		} else {
			jSONObject.put("result", "0");
		}
		return jSONObject.toString();
	}

}
