package com.pow.dao;

import java.util.List;

import com.pow.mybatis.IMarkerInterface;
import com.pow.vo.AnnouncementVO;

public interface AnnouncementDao extends IMarkerInterface {

	public void insertAnnouncement(AnnouncementVO vo);
	
	public void deleteAnnouncement(String id);
	
	public void updateAnnouncement(AnnouncementVO vo);
	
	public List<AnnouncementVO> queryAllAnnouncements();
	
	public AnnouncementVO queryOneAnnouncement(String id);
}
