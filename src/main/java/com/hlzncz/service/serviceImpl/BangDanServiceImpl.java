package com.hlzncz.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class BangDanServiceImpl implements BangDanService {

	@Autowired
	private BangDanMapper bangDanDao;
	
	@Override
	public BangDan selectBangDanByDdbm(String wybm) {
		// TODO Auto-generated method stub
		return bangDanDao.selectBangDanByDdbm(wybm);
	}

}
