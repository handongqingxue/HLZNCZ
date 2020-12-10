package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class KaPianWeiHuServiceImpl implements KaPianWeiHuService {

	@Autowired
	private KaPianWeiHuMapper kaPianWeiHuDao;

	@Override
	public int newKaPianWeiHu(KaPianWeiHu kpwh) {
		// TODO Auto-generated method stub
		return kaPianWeiHuDao.newKaPianWeiHu(kpwh);
	}

	@Override
	public int deleteKaPianWeiHu(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = kaPianWeiHuDao.deleteKaPianWeiHu(idList);
		return count;
	}

	@Override
	public int editKaPianWeiHu(KaPianWeiHu kpwh) {
		// TODO Auto-generated method stub
		return kaPianWeiHuDao.editKaPianWeiHu(kpwh);
	}

	@Override
	public int queryKaPianWeiHuForInt(String kh) {
		// TODO Auto-generated method stub
		return kaPianWeiHuDao.queryKaPianWeiHuForInt(kh);
	}

	@Override
	public List<KaPianWeiHu> queryKaPianWeiHuList(String kh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return kaPianWeiHuDao.queryKaPianWeiHuList(kh, (page-1)*rows, rows, sort, order);
	}

	@Override
	public KaPianWeiHu selectKaPianWeiHuById(String id) {
		// TODO Auto-generated method stub
		return kaPianWeiHuDao.selectKaPianWeiHuById(id);
	}
}
