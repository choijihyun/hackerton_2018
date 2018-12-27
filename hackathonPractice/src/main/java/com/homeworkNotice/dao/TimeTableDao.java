package com.homeworkNotice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homeworkNotice.dto.HomeworkDto;
import com.homeworkNotice.dto.SubjectDto;
import com.homeworkNotice.dto.TimeTableDto;

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
	
	public int getNum(HashMap<Object, Object> param) {
		System.out.println("param = "+param);
		System.out.println("겨로가  : " + sqlSession.selectList("TimeTableDao.getNum",param).get(0)); 
		return sqlSession.selectOne("TimeTableDao.getNum",param);		
	}
	public int getPassNum(HashMap<Object, Object> param) {
		return sqlSession.selectOne("TimeTableDao.getPassNum",param);
	}
}
