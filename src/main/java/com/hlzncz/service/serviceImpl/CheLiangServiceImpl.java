package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class CheLiangServiceImpl implements CheLiangService {

	@Autowired
	private CheLiangMapper cheLiangDao;

	@Override
	public int newCheLiang(CheLiang cl) {
		// TODO Auto-generated method stub
		return cheLiangDao.newCheLiang(cl);
	}

	@Override
	public int deleteCheLiang(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = cheLiangDao.deleteCheLiang(idList);
		return count;
	}

	@Override
	public int shenHeCheLiang(String ids,String flag) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = cheLiangDao.shenHeCheLiang(idList,flag);
		return count;
	}

	@Override
	public int editCheLiang(CheLiang cl) {
		// TODO Auto-generated method stub
		return cheLiangDao.editCheLiang(cl);
	}

	@Override
	public int queryCheLiangForInt(String cph, Integer cllx, Boolean sfzy, Integer pfjd, String shzt, String bz) {
		// TODO Auto-generated method stub
		return cheLiangDao.queryCheLiangForInt(cph,cllx,sfzy,pfjd,shzt,bz);
	}

	@Override
	public List<CheLiang> queryCheLiangList(String cph, Integer cllx, Boolean sfzy, Integer pfjd, String shzt, String bz, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return cheLiangDao.queryCheLiangList(cph, cllx, sfzy, pfjd, shzt, bz, (page-1)*rows, rows, sort, order);
	}

	@Override
	public CheLiang selectCheLiangById(String id) {
		// TODO Auto-generated method stub
		return cheLiangDao.selectCheLiangById(id);
	}
}
