
package com.pow.dao;

import java.util.List;

import com.pow.mybatis.IMarkerInterface;
import com.pow.vo.SignUpVO;

public interface SignUpDao extends IMarkerInterface{

	public void insertSignUp(SignUpVO vo);
	
	public void deleteSignUp(SignUpVO vo);
	
	public void deleteSignUpsByAnnouncementId(String announcementId);
	
	public void deleteSignUpsByCoserId(String coserId);
	
	public List<SignUpVO> querySignUpsByAnnouncementId(String announcementId);
	
	public List<SignUpVO> querySignUpsByCoserId(String coserId);
	
	public SignUpVO querySignUp(SignUpVO vo);
	
}

