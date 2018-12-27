package com.homeworkNotice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homeworkNotice.dto.PassDto;
import com.homeworkNotice.dto.UserDto;

@Repository
public class PassDao {
	@Autowired
    private SqlSession sqlSession;    
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertPass(HashMap<Object, Object> param) {
		return sqlSession.insert("PassDao.insertPass", param);		
	}

	public List<PassDto> getPass(HashMap<Object, Object> param) { 
		return sqlSession.selectList("PassDao.getPass", param);
	}
	
	public List<PassDto> getOrderExam(HashMap<Object,Object> param){
		return sqlSession.selectList("PassDao.getOrderExam", param);
	}
	
}