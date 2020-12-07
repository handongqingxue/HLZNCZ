package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class YunShuShangServiceImpl implements YunShuShangService {

	@Autowired
	private YunShuShangMapper yunShuShangDao;
	
	@Override
	public int newYunShuShang(YunShuShang yss) {
		// TODO Auto-generated method stub
		return yunShuShangDao.newYunShuShang(yss);
	}

	@Override
	public int deleteYuShuShang(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = yunShuShangDao.deleteYuShuShang(idList);
		return count;
	}

	@Override
	public int editYunShuShang(YunShuShang yss) {
		// TODO Auto-generated method stub
		return yunShuShangDao.editYunShuShang(yss);
	}

	@Override
	public int queryYunShuShangForInt(String mc) {
		// TODO Auto-generated method stub
		return yunShuShangDao.queryYunShuShangForInt(mc);
	}

	@Override
	public List<YunShuShang> queryYunShuShangList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return yunShuShangDao.queryYunShuShangList(mc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public YunShuShang selectYunShuShangById(String id) {
		// TODO Auto-generated method stub
		return yunShuShangDao.selectYunShuShangById(id);
	}
}
