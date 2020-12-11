package com.hlzncz.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class HaoMaZhuangTaiServiceImpl implements HaoMaZhuangTaiService {

	@Autowired
	private HaoMaZhuangTaiMapper haoMaZhuangTaiDao;

	@Override
	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList() {
		// TODO Auto-generated method stub
		return haoMaZhuangTaiDao.queryHaoMaZhuangTaiCBBList();
	}
}
