package com.pow.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pow.dao.AnnouncementDao;
import com.pow.dao.RoleDao;
import com.pow.dao.WorksDao;
import com.pow.utils.PKGenerator;
import com.pow.vo.AnnouncementVO;
import com.pow.vo.RoleVO;
import com.pow.vo.WorksVO;

@Service("announcementService")
public class AnnouncementServiceImpl implements AnnouncementService {
	
	@Autowired
	private AnnouncementDao announcementDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private WorksDao worksDao;

	@Override
	public void createAnnouncement(AnnouncementVO vo) {
		String announcementId = PKGenerator.generate();
		vo.setId(announcementId);
		Date date = new Date();
		vo.setCreateTime(date);
		vo.setUpdateTime(date);
		vo.setStatus(0);
		announcementDao.insertAnnouncement(vo);
		List<RoleVO> roles = vo.getRoles();
		if(roles != null){
			for(RoleVO role : roles){
				role.setId(PKGenerator.generate());
				role.setAnnouncementId(announcementId);
				roleDao.insertRole(role);
			}
		}
		List<WorksVO> workses = vo.getWorkses();
		if(workses != null){
			for(WorksVO works:workses){
				works.setId(PKGenerator.generate());
				works.setAnnouncementId(announcementId);
				worksDao.insertWorks(works);
			}
		}
	}

	@Override
	public void deleteAnnouncement(String announcementId) {
		announcementDao.deleteAnnouncement(announcementId);
		roleDao.deleteRolesByAnnouncementId(announcementId);
		worksDao.deleteWorksByAnnouncementId(announcementId);
	}

	@Override
	public void updateAnnouncement(AnnouncementVO vo) {
		announcementDao.updateAnnouncement(vo);
		List<RoleVO> roles = vo.getRoles();
		for(RoleVO role : roles){
			roleDao.updateRole(role);
		}
		List<WorksVO> workses = vo.getWorkses();
		for(WorksVO works:workses){
			worksDao.updateWorks(works);
		}
	}

	@Override
	public List<AnnouncementVO> queryAllAnnouncements() {
		List<AnnouncementVO> announcements = announcementDao.queryAllAnnouncements();
		for(AnnouncementVO announcement:announcements){
			announcement.setRoles(roleDao.queryRolesByAnnouncementId(announcement.getId()));
			announcement.setWorkses(worksDao.queryWorksByAnnouncementId(announcement.getId()));
		}
		return announcements;
	}

	@Override
	public AnnouncementVO queryOneAnnouncement(String announcementId) {
		AnnouncementVO announcement = announcementDao.queryOneAnnouncement(announcementId);
		announcement.setRoles(roleDao.queryRolesByAnnouncementId(announcementId));
		announcement.setWorkses(worksDao.queryWorksByAnnouncementId(announcementId));
		return announcement;
	}

}
