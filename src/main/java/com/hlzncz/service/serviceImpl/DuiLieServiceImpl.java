package com.hlzncz.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class DuiLieServiceImpl implements DuiLieService {

	@Autowired
	private DuiLieMapper duiLieDao;

	@Override
	public int newDuiLie(DuiLie dl) {
		// TODO Auto-generated method stub
		return duiLieDao.newDuiLie(dl);
	}

	@Override
	public int editDuiLie(DuiLie dl) {
		// TODO Auto-generated method stub
		return duiLieDao.editDuiLie(dl);
	}

	@Override
	public int queryDuiLieForInt(String mc, String dm, Integer zt) {
		// TODO Auto-generated method stub
		return duiLieDao.queryDuiLieForInt(mc,dm,zt);
	}

	@Override
	public List<DuiLie> queryDuiLieList(String mc, String dm, Integer zt, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return duiLieDao.queryDuiLieList(mc, dm, zt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public DuiLie selectDuiLieById(String id) {
		// TODO Auto-generated method stub
		return duiLieDao.selectDuiLieById(id);
	}
}
