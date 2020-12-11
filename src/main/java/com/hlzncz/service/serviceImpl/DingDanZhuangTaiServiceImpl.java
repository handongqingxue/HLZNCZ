package com.hlzncz.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class DingDanZhuangTaiServiceImpl implements DingDanZhuangTaiService {

	@Autowired
	private DingDanZhuangTaiMapper dingDanZhuangTaiDao;

	@Override
	public List<DingDanZhuangTai> queryDingDanZhuangTaiCBBList() {
		// TODO Auto-generated method stub
		return dingDanZhuangTaiDao.queryDingDanZhuangTaiCBBList();
	}
}
