package com.pow.service;

import java.util.List;

import com.pow.vo.AnnouncementVO;

public interface AnnouncementService {

	public void createAnnouncement(AnnouncementVO vo);
	
	public void deleteAnnouncement(String id);
	
	public void updateAnnouncement(AnnouncementVO vo);
	
	public List<AnnouncementVO> queryAllAnnouncements();
	
	public AnnouncementVO queryOneAnnouncement(String id);
}
