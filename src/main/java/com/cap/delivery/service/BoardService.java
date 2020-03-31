package com.cap.delivery.service;

import java.util.List;

import com.cap.delivery.model.ReservationDto;
import com.cap.delivery.model.SearchDto;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;

public interface BoardService {

	SearchResponseVO lookupResult(SearchDto searchDto);
	List<SearchResponseListVO> lookupListResult(SearchDto searchDto);
	void reservationInsert(ReservationDto reservationDto);
}
