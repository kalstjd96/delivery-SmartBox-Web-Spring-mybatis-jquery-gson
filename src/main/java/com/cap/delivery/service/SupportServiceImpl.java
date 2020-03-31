package com.cap.delivery.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cap.delivery.dao.SupportDao;
import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;

@Service
public class SupportServiceImpl implements SupportService {

	@Autowired
	private SupportDao supportDao;
	
	@Override
	public void deleteFile(HttpSession session, String uploadPath) {
		if(session.getAttribute("fileName") != null) {
			List<String> fileNameArr = (ArrayList<String>) session.getAttribute("fileName");
			for(String fileName : fileNameArr) {
				System.out.println("삭제파일이름: "+fileName);
				String front=fileName.substring(0, 12);
				String end=fileName.substring(14);
				new File(uploadPath+(front+end).replace('/',File.separatorChar)).delete();
				new File(uploadPath+fileName.replace('/',File.separatorChar)).delete();
			}
			session.removeAttribute("fileName");
		}
	}

	@Override
	public void insertInquiry(InquiryVO inquiryVO, FileVO fileVO) {
		supportDao.insertInquiry(inquiryVO, fileVO);
	}

}
