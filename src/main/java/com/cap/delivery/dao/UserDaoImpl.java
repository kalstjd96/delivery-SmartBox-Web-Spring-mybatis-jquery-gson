package com.cap.delivery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cap.delivery.model.LoginDto;
import com.cap.delivery.model.SignupDto;
import com.cap.delivery.model.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int ajaxChkId(String inputId) {
		return sqlSession.selectOne("userMapper.chkInputId", inputId);
	}

	@Override
	public void insertSignup(SignupDto signupDto) {
		sqlSession.insert("userMapper.insertSignup", signupDto);
	}
	
	@Override
	public String login(String userId) {
		return sqlSession.selectOne("userMapper.login", userId);
	}

	@Override
	public UserVO sessionRegister(LoginDto loginDto) {
		return sqlSession.selectOne("userMapper.sessionRegister", loginDto);
	}
}
