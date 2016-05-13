package com.pow.dao;

import java.util.List;

import com.pow.mybatis.IMarkerInterface;
import com.pow.vo.RoleVO;

public interface RoleDao extends IMarkerInterface {

	public void insertRole(RoleVO role);
	
	public void updateRole(RoleVO role);
	
	public void deleteRolesByAnnouncementId(String announcementId);
	
	public List<RoleVO> queryRolesByAnnouncementId(String announcementId);
	
}
