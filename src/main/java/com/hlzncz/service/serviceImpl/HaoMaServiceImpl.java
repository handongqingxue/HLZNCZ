package com.hlzncz.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class HaoMaServiceImpl implements HaoMaService {

	@Autowired
	private HaoMaMapper haoMaDao;

	@Override
	public int queryHaoMaForInt(String hm, String pdh, Integer ztId) {
		// TODO Auto-generated method stub
		return haoMaDao.queryHaoMaForInt(hm,pdh,ztId);
	}

	@Override
	public List<HaoMa> queryHaoMaList(String hm, String pdh, Integer ztId, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return haoMaDao.queryHaoMaList(hm, pdh, ztId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int newHaoMaChaXun(HaoMa hm) {
		// TODO Auto-generated method stub
		return haoMaDao.newHaoMaChaXun(hm);
	}

	@Override
	public HaoMa selectHaoMaById(String id) {
		// TODO Auto-generated method stub
		return haoMaDao.selectHaoMaById(id);
	}
}
