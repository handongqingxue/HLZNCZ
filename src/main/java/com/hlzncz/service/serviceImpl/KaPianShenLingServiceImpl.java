package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class KaPianShenLingServiceImpl implements KaPianShenLingService {

	@Autowired
	private KaPianShenLingMapper kaPianShenLingDao;

	@Override
	public int newKaPianShenLing(KaPianShenLing kpsl) {
		// TODO Auto-generated method stub
		return kaPianShenLingDao.newKaPianShenLing(kpsl);
	}

	@Override
	public int deleteKaPianShenLing(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = kaPianShenLingDao.deleteKaPianShenLing(idList);
		return count;
	}

	@Override
	public int editKaPianShenLing(KaPianShenLing kpsl) {
		// TODO Auto-generated method stub
		return kaPianShenLingDao.editKaPianShenLing(kpsl);
	}

	@Override
	public int queryKaPianShenLingForInt(String sfzh) {
		// TODO Auto-generated method stub
		return kaPianShenLingDao.queryKaPianShenLingForInt(sfzh);
	}

	@Override
	public List<KaPianShenLing> queryKaPianShenLingList(String sfzh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return kaPianShenLingDao.queryKaPianShenLingList(sfzh, (page-1)*rows, rows, sort, order);
	}

	@Override
	public KaPianShenLing selectKaPianShenLingById(String id) {
		// TODO Auto-generated method stub
		return kaPianShenLingDao.selectKaPianShenLingById(id);
	}
}
