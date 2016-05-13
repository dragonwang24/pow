
package com.pow.service;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pow.dao.CoserDao;
import com.pow.vo.CoserVO;

@Service("coserService")
public class CoserServiceImpl implements CoserService {
	
	Logger logger = LoggerFactory.getLogger(CoserServiceImpl.class);
	
	@Autowired
	private CoserDao coserDao;

	@Override
	public CoserVO createCoser(CoserVO vo) {
		Date date = new Date();
		vo.setCreateTime(date);
		vo.setUpdateTime(date);
		try{
			coserDao.insertCoser(vo);
		}catch(Exception e){
			logger.error(e.getMessage());
			e.printStackTrace();
			return null;
		}
		return vo;
	}

	@Override
	public void deleteCoser(String id) {
		coserDao.deleteCoser(id);
	}

	@Override
	public void updateCoser(CoserVO vo) {
		coserDao.updateCoser(vo);
	}
	
	@Override
	public void updateCoserTwo(CoserVO vo) {
		coserDao.updateCoserTwo(vo);
	}
	
	@Override
	public void updateCoserThree(CoserVO vo) {
		coserDao.updateCoserThree(vo);
	}

	@Override
	public List<CoserVO> queryAllCosers() {
		return coserDao.queryAllCosers();
	}

	@Override
	public CoserVO queryOneCoser(String id) {
		return coserDao.queryOneCoser(id);
	}

}

