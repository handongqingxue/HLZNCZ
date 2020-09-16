package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.WuZiLeiXing;
import com.hlzncz.service.PublicService;

@Service
public class PublicServiceImpl implements PublicService {
	
	@Autowired
	private PublicMapper publicDao;

	public List<CaiDan> selectParCaiDan() {
		// TODO Auto-generated method stub
		return publicDao.selectParCaiDan();
	}

	public List<CaiDan> selectChildCaiDan(Integer parId) {
		// TODO Auto-generated method stub
		return publicDao.selectChildCaiDan(parId);
	}

	@Override
	public int queryWuZiLeiXingForInt(String mc) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiLeiXingForInt(mc);
	}

	@Override
	public List<WuZiLeiXing> queryWuZiLeiXingList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiLeiXingList(mc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public WuZiLeiXing selectWuZiLeiXingById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectWuZiLeiXingById(id);
	}

	@Override
	public int newWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return publicDao.newWuZiLeiXing(wzlx);
	}

	@Override
	public int editWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return publicDao.editWuZiLeiXing(wzlx);
	}

	@Override
	public int deleteWuZiLeiXing(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=publicDao.deleteWuZiLeiXing(idList);
		return count;
	}

}
