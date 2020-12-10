package com.hlzncz.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class DingDanYiChangServiceImpl implements DingDanYiChangService {

	@Autowired
	private DingDanYiChangMapper dingDanYiChangDao;
	
	@Override
	public List<DingDanYiChang> selectDingDanYiChangByDdbm(String wybm) {
		// TODO Auto-generated method stub
		return dingDanYiChangDao.selectDingDanYiChangByDdbm(wybm);
	}
}
