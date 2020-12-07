package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.FaHuoDanWei;
import com.hlzncz.service.FaHuoDanWeiService;

@Service
public class FaHuoDanWeiServiceImpl implements FaHuoDanWeiService {

	@Autowired
	private FaHuoDanWeiMapper faHuoDanWeiDao;
	
	@Override
	public int newFaHuoDanWei(FaHuoDanWei fhdw) {
		// TODO Auto-generated method stub
		return faHuoDanWeiDao.newFaHuoDanWei(fhdw);
	}

	@Override
	public int deleteFaHuoDanWei(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = faHuoDanWeiDao.deleteFaHuoDanWei(idList);
		return count;
	}

	@Override
	public int editFaHuoDanWei(FaHuoDanWei fhdw) {
		// TODO Auto-generated method stub
		return faHuoDanWeiDao.editFaHuoDanWei(fhdw);
	}

	@Override
	public int queryFaHuoDanWeiForInt(String dwmc) {
		// TODO Auto-generated method stub
		return faHuoDanWeiDao.queryFaHuoDanWeiForInt(dwmc);
	}

	@Override
	public List<FaHuoDanWei> queryFaHuoDanWeiList(String dwmc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return faHuoDanWeiDao.queryFaHuoDanWeiList(dwmc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public FaHuoDanWei selectFaHuoDanWeiById(String id) {
		// TODO Auto-generated method stub
		return faHuoDanWeiDao.selectFaHuoDanWeiById(id);
	}
}
