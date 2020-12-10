package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.SiJiMapper;
import com.hlzncz.entity.SiJi;
import com.hlzncz.service.SiJiService;

@Service
public class SiJiServiceImpl implements SiJiService {
	
	@Autowired
	private SiJiMapper siJiDao;
	
	@Override
	public int newSiJi(SiJi sj) {
		// TODO Auto-generated method stub
		return siJiDao.newSiJi(sj);
	}

	@Override
	public int deleteSiJi(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = siJiDao.deleteSiJi(idList);
		return count;
	}

	@Override
	public int editSiJi(SiJi sj) {
		// TODO Auto-generated method stub
		return siJiDao.editSiJi(sj);
	}

	@Override
	public int querySiJiForInt(String xm, String sfz, Integer zyzt,String shzt) {
		// TODO Auto-generated method stub
		return siJiDao.querySiJiForInt(xm,sfz,zyzt,shzt);
	}

	@Override
	public List<SiJi> querySiJiList(String xm, String sfz, Integer zyzt, String shzt, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return siJiDao.querySiJiList(xm, sfz, zyzt, shzt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public SiJi selectSiJiById(String id) {
		// TODO Auto-generated method stub
		return siJiDao.selectSiJiById(id);
	}

	@Override
	public int shenHeSiJi(String ids, String flag) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = siJiDao.shenHeSiJi(idList,flag);
		return count;
	}

}
