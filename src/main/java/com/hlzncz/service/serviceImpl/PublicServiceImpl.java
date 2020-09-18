package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.CheLiang;
import com.hlzncz.entity.WuZi;
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
	public int newWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return publicDao.newWuZiLeiXing(wzlx);
	}

	@Override
	public int deleteWuZiLeiXing(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=publicDao.deleteWuZiLeiXing(idList);
		return count;
	}

	@Override
	public int editWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return publicDao.editWuZiLeiXing(wzlx);
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
	public int newWuZi(WuZi wz) {
		// TODO Auto-generated method stub
		return publicDao.newWuZi(wz);
	}

	@Override
	public int deleteWuZi(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=publicDao.deleteWuZi(idList);
		return count;
	}

	@Override
	public int editWuZi(WuZi wz) {
		// TODO Auto-generated method stub
		return publicDao.editWuZi(wz);
	}

	@Override
	public int queryWuZiForInt(String mc, String wzlxmc) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiForInt(mc,wzlxmc);
	}

	@Override
	public List<WuZi> queryWuZiList(String mc, String wzlxmc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiList(mc, wzlxmc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public WuZi selectWuZiById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectWuZiById(id);
	}

	@Override
	public int newCheLiang(CheLiang cl) {
		// TODO Auto-generated method stub
		return publicDao.newCheLiang(cl);
	}

	@Override
	public int deleteCheLiang(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteCheLiang(idList);
		return count;
	}

	@Override
	public int editCheLiang(CheLiang cl) {
		// TODO Auto-generated method stub
		return publicDao.editCheLiang(cl);
	}

	@Override
	public int queryCheLiangForInt(String cph, Integer cllx) {
		// TODO Auto-generated method stub
		return publicDao.queryCheLiangForInt(cph,cllx);
	}

	@Override
	public List<CheLiang> queryCheLiangList(String cph, Integer cllx, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryCheLiangList(cph, cllx, (page-1)*rows, rows, sort, order);
	}

	@Override
	public CheLiang selectCheLiangById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectCheLiangById(id);
	}

}
