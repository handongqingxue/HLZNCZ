package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class YongHuServiceImpl implements YongHuService {

	@Autowired
	private YongHuMapper yongHuDao;

	@Override
	public int newYongHu(YongHu yh) {
		// TODO Auto-generated method stub
		return yongHuDao.newYongHu(yh);
	}

	@Override
	public int deleteYongHu(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = yongHuDao.deleteYongHu(idList);
		return count;
	}

	@Override
	public int editYongHu(YongHu yh) {
		// TODO Auto-generated method stub
		return yongHuDao.editYongHu(yh);
	}

	@Override
	public int queryYongHuForInt(String yhm, Integer zt) {
		// TODO Auto-generated method stub
		return yongHuDao.queryYongHuForInt(yhm,zt);
	}

	@Override
	public List<YongHu> queryYongHuList(String yhm, Integer zt, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return yongHuDao.queryYongHuList(yhm, zt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public YongHu selectYongHuById(String id) {
		// TODO Auto-generated method stub
		return yongHuDao.selectYongHuById(id);
	}

	@Override
	public YongHu selectSiJiYongHuById(String id) {
		// TODO Auto-generated method stub
		return yongHuDao.selectSiJiYongHuById(id);
	}
}
