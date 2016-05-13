package com.pow.dao;

import java.util.List;

import com.pow.mybatis.IMarkerInterface;
import com.pow.vo.CoserVO;

public interface CoserDao extends IMarkerInterface {

	public void insertCoser(CoserVO vo);
	
	public void deleteCoser(String id);
	
	public void updateCoser(CoserVO vo);
	
	public void updateCoserTwo(CoserVO vo);
	
	public void updateCoserThree(CoserVO vo);
	
	public List<CoserVO> queryAllCosers();
	
	public CoserVO queryOneCoser(String id);
}
