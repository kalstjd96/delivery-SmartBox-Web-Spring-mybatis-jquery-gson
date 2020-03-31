package com.cap.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cap.delivery.commons.paging.Criteria;
import com.cap.delivery.dao.NoticeDao;
import com.cap.delivery.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int noticeListCount() {
		return noticeDao.noticeListCount();
	}

	@Override
	public List<NoticeVO> noticeCriteria(Criteria criteria) {
		return noticeDao.noticeCriteria(criteria);
	}

	@Override
	public NoticeVO noticeRead(Integer noticeNo) {
		return noticeDao.noticeRead(noticeNo);
	}

	@Override
	public void noticeModify(NoticeVO noticeVO) {
		noticeDao.noticeModify(noticeVO);
	}

	@Override
	public void noticeDelete(int noticeNo) {
		noticeDao.noticeDelete(noticeNo);
	}

	@Override
	public void noticeInsert(NoticeVO noticeVO) {
		noticeDao.noticeInsert(noticeVO);
	}

	@Override
	public List<NoticeVO> mainList() {
		return noticeDao.mainList();
	}

}
