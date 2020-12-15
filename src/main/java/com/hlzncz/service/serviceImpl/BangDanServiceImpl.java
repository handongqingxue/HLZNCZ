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

	@Override
	public int editErBangWaiJian(BangDan bd) {
		// TODO Auto-generated method stub
		if(bangDanDao.selectBangDanByDdbm(bd.getDdbm())==null)
			return bangDanDao.insertErBangWaiJian(bd);
		else
			return bangDanDao.editErBangWaiJian(bd);
	}

}
