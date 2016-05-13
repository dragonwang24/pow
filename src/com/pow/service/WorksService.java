package com.pow.service;

import java.util.List;

import com.pow.vo.WorksVO;

public interface WorksService {

	public void createWorks(WorksVO works);
	
	public void updateWorks(WorksVO works);
	
	public void deleteWorksByAnnouncementId(String announcementId);
	
	public List<WorksVO> queryWorksByAnnouncementId(String announcementId);
	
}
