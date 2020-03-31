package com.cap.delivery.dao;

import java.util.List;

import com.cap.delivery.model.ReservationDto;
import com.cap.delivery.model.SearchDto;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;

public interface BoardDao {
SearchResponseVO lookupResult(SearchDto searchDto);
List<SearchResponseListVO> lookupListResult(SearchDto searchDto);
void reservationInsert(ReservationDto reservationDto);
}
