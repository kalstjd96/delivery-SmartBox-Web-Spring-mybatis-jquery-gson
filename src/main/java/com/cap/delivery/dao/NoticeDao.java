package com.cap.delivery.dao;

import java.util.List;

import com.cap.delivery.commons.paging.Criteria;
import com.cap.delivery.model.NoticeVO;

public interface NoticeDao {
	int noticeListCount();
	List<NoticeVO> noticeCriteria(Criteria criteria);
	NoticeVO noticeRead(Integer noticeNo);
	void noticeModify(NoticeVO noticeVO);
	void noticeDelete(int noticeNo);
	void noticeInsert(NoticeVO noticeVO);
	List<NoticeVO> mainList();
}
