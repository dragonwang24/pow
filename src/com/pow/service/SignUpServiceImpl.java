package com.pow.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pow.dao.SignUpDao;
import com.pow.vo.SignUpVO;

@Service("signUpService")
public class SignUpServiceImpl implements SignUpService {
	Logger logger = LoggerFactory.getLogger(SignUpServiceImpl.class);

	@Autowired
	private SignUpDao signUpDao;
	
	@Override
	public void insertSignUp(SignUpVO vo) {
		vo.setId(UUID.randomUUID().toString());
		vo.setSignUpTime(new Date());
		signUpDao.insertSignUp(vo);
	}

	@Override
	public void deleteSignUp(SignUpVO vo) {
		signUpDao.deleteSignUp(vo);
	}

	@Override
	public void deleteSignUpsByAnnouncementId(String announcementId) {
		signUpDao.deleteSignUpsByAnnouncementId(announcementId);
	}

	@Override
	public void deleteSignUpsByCoserId(String coserId) {
		signUpDao.deleteSignUpsByCoserId(coserId);
	}

	@Override
	public List<SignUpVO> querySignUpsByAnnouncementId(String announcementId) {
		return signUpDao.querySignUpsByAnnouncementId(announcementId);
	}

	@Override
	public List<SignUpVO> querySignUpsByCoserId(String coserId) {
		return signUpDao.querySignUpsByCoserId(coserId);
	}

	@Override
	public SignUpVO querySignUp(SignUpVO vo) {
		return signUpDao.querySignUp(vo);
	}

}
