package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class WuZiLeiXingServiceImpl implements WuZiLeiXingService {

	@Autowired
	private WuZiLeiXingMapper wuZiLeiXingDao;

	@Override
	public int newWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return wuZiLeiXingDao.newWuZiLeiXing(wzlx);
	}

	@Override
	public int deleteWuZiLeiXing(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=wuZiLeiXingDao.deleteWuZiLeiXing(idList);
		return count;
	}

	@Override
	public int editWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return wuZiLeiXingDao.editWuZiLeiXing(wzlx);
	}

	@Override
	public int queryWuZiLeiXingForInt(String mc) {
		// TODO Auto-generated method stub
		return wuZiLeiXingDao.queryWuZiLeiXingForInt(mc);
	}

	@Override
	public List<WuZiLeiXing> queryWuZiLeiXingList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return wuZiLeiXingDao.queryWuZiLeiXingList(mc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public WuZiLeiXing selectWuZiLeiXingById(String id) {
		// TODO Auto-generated method stub
		return wuZiLeiXingDao.selectWuZiLeiXingById(id);
	}
}
