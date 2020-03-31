package com.cap.delivery;

import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cap.delivery.dao.BoardDao;
import com.cap.delivery.model.SearchDto;
import com.cap.delivery.model.SearchResponseListVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class JunitTest {

	private static final Logger logger = LoggerFactory.getLogger(JunitTest.class);
	
	@Autowired
	private BoardDao boardDao;
	
	@Test
	public void test() throws Exception {
		SearchDto searchDto = new SearchDto();
		searchDto.setWaybillNum("11111111111");
		boardDao.lookupResult(searchDto);
		List<SearchResponseListVO> searchResponseVO= boardDao.lookupListResult(searchDto);
		for(SearchResponseListVO i : searchResponseVO) {
			System.out.println(i.toString());
		}
	}
}
