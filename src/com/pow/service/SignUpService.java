package com.pow.service;

import java.util.List;

import com.pow.vo.SignUpVO;

public interface SignUpService {

	public void insertSignUp(SignUpVO vo);
	
	public void deleteSignUp(SignUpVO vo);
	
	public void deleteSignUpsByAnnouncementId(String announcementId);
	
	public void deleteSignUpsByCoserId(String coserId);
	
	public List<SignUpVO> querySignUpsByAnnouncementId(String announcementId);
	
	public List<SignUpVO> querySignUpsByCoserId(String coserId);
	
	public SignUpVO querySignUp(SignUpVO vo);
}

