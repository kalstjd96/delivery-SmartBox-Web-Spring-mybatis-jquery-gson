package com.cap.delivery.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cap.delivery.dao.BoardDao;
import com.cap.delivery.model.ReservationDto;
import com.cap.delivery.model.SearchDto;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public SearchResponseVO lookupResult(SearchDto searchDto) {
		return boardDao.lookupResult(searchDto);
	}

	@Override
	public List<SearchResponseListVO> lookupListResult(SearchDto searchDto) {
		return boardDao.lookupListResult(searchDto);
	}

	@Override
	public void reservationInsert(ReservationDto reservationDto) {
		boardDao.reservationInsert(reservationDto);
	}

}
