package com.cap.delivery.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;

@Repository
public class SupportDaoImpl implements SupportDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	@Override
	public void insertInquiry(InquiryVO inquiryVO, FileVO fileVO) {
		sqlSession.insert("supportMapper.inquiryInsert", inquiryVO);
		if(fileVO.getFileNameArr() != null) {
			for(int i=0; i<fileVO.getFileNameArr().length; i++) {
				fileVO.setFileName(fileVO.getFileNameArr()[i]);
				fileVO.setFileLocation(fileVO.getFileLocationArr()[i]);
				fileVO.setFileSize(fileVO.getFileSizeArr()[i]);
				sqlSession.insert("supportMapper.fileInsert", fileVO);

			}
		}
	}
}