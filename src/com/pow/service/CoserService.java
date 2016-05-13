package com.pow.service;

import java.util.List;

import com.pow.vo.CoserVO;

public interface CoserService {

	public CoserVO createCoser(CoserVO vo);
	
	public void deleteCoser(String id);
	
	public void updateCoser(CoserVO vo);
	
	public void updateCoserTwo(CoserVO vo);
	
	public void updateCoserThree(CoserVO vo);
	
	public List<CoserVO> queryAllCosers();
	
	public CoserVO queryOneCoser(String id);
}
