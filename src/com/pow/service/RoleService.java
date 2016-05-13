package com.pow.service;

import java.util.List;

import com.pow.vo.RoleVO;

public interface RoleService {

	public void createRole(RoleVO role);
	
	public void updateRole(RoleVO role);
	
	public void deleteRolesByAnnouncementId(String announcementId);
	
	public List<RoleVO> queryRolesByAnnouncementId(String announcementId);
	
}
