package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class CangKuServiceImpl implements CangKuService {

	@Autowired
	private CangKuMapper cangKuDao;

	@Override
	public int newCangKu(CangKu ck) {
		// TODO Auto-generated method stub
		return cangKuDao.newCangKu(ck);
	}

	@Override
	public int deleteCangKu(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = cangKuDao.deleteCangKu(idList);
		return count;
	}

	@Override
	public int editCangKu(CangKu ck) {
		// TODO Auto-generated method stub
		return cangKuDao.editCangKu(ck);
	}

	@Override
	public int queryCangKuForInt(String mc) {
		// TODO Auto-generated method stub
		return cangKuDao.queryCangKuForInt(mc);
	}

	@Override
	public List<CangKu> queryCangKuList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return cangKuDao.queryCangKuList(mc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public CangKu selectCangKuById(String id) {
		// TODO Auto-generated method stub
		return cangKuDao.selectCangKuById(id);
	}
}
