package com.pow.dao;

import java.util.List;

import com.pow.mybatis.IMarkerInterface;
import com.pow.vo.WorksVO;

public interface WorksDao extends IMarkerInterface {

	public void insertWorks(WorksVO works);
	
	public void updateWorks(WorksVO works);
	
	public void deleteWorksByAnnouncementId(String announcementId);
	
	public List<WorksVO> queryWorksByAnnouncementId(String announcementId);
	
}
