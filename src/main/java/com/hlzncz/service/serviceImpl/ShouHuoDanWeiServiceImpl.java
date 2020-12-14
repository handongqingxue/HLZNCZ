package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class ShouHuoDanWeiServiceImpl implements ShouHuoDanWeiService {

	@Autowired
	private ShouHuoDanWeiMapper shouHuoDanWeiDao;
	
	@Override
	public int newShouHuoDanWei(ShouHuoDanWei shdw) {
		// TODO Auto-generated method stub
		return shouHuoDanWeiDao.newShouHuoDanWei(shdw);
	}

	@Override
	public int deleteShouHuoDanWei(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = shouHuoDanWeiDao.deleteShouHuoDanWei(idList);
		return count;
	}
	
	@Override
	public int editShouHuoDanWei(ShouHuoDanWei shdw) {
		// TODO Auto-generated method stub
		return shouHuoDanWeiDao.editShouHuoDanWei(shdw);
	}

	@Override
	public int queryShouHuoDanWeiForInt(String dwmc,Boolean ywdl) {
		// TODO Auto-generated method stub
		return shouHuoDanWeiDao.queryShouHuoDanWeiForInt(dwmc,ywdl);
	}

	@Override
	public List<ShouHuoDanWei> queryShouHuoDanWeiList(String dwmc, Boolean ywdl, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return shouHuoDanWeiDao.queryShouHuoDanWeiList(dwmc, ywdl, (page-1)*rows, rows, sort, order);
	}

	@Override
	public ShouHuoDanWei selectShouHuoDanWeiById(String id) {
		// TODO Auto-generated method stub
		return shouHuoDanWeiDao.selectShouHuoDanWeiById(id);
	}

	@Override
	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(String ids) {
		// TODO Auto-generated method stub
		return shouHuoDanWeiDao.queryShouHuoDanWeiByIds(ids);
	}
}
