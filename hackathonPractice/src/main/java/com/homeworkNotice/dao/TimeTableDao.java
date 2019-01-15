package com.homeworkNotice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homeworkNotice.dto.HomeworkDto;
import com.homeworkNotice.dto.SubjectDto;
import com.homeworkNotice.dto.TimeTableDto;
import com.homeworkNotice.dto.UserDto;

@Repository
public class TimeTableDao {
	@Autowired
    private SqlSession sqlSession;    
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<UserDto> getNum(HashMap<Object, Object> param) {
		System.out.println("param = "+param);
		return sqlSession.selectList("TimeTableDao.getNum",param);		
	}
	public List<UserDto> getPassNum(HashMap<Object, Object> param) {
		return sqlSession.selectList("TimeTableDao.getPassNum",param);
	}
}
