package com.cap.delivery.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cap.delivery.model.ReservationDto;
import com.cap.delivery.model.SearchDto;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SearchResponseVO lookupResult(SearchDto searchDto) {
		return sqlSession.selectOne("boardMapper.lookupResult", searchDto);
	}

	@Override
	public List<SearchResponseListVO> lookupListResult(SearchDto searchDto) {
		return sqlSession.selectList("boardMapper.lookupListResult", searchDto);
	}

	@Override
	@Transactional
	public void reservationInsert(ReservationDto reservationDto) {
		sqlSession.insert("boardMapper.reservationInsert", reservationDto);
		sqlSession.insert("boardMapper.reservationInsert2");
	}
}
