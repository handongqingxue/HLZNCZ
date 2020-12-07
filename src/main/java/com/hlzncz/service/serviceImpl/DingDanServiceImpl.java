package com.hlzncz.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.DingDanMapper;
import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.DingDan;
import com.hlzncz.service.DingDanService;

@Service
public class DingDanServiceImpl implements DingDanService {


	@Autowired
	private DingDanMapper dingDanDao;
	
	@Override
	public DingDan selectDingDanByWybm(String wybm) {
		// TODO Auto-generated method stub
		return dingDanDao.selectDingDanByWybm(wybm);
	}

}
