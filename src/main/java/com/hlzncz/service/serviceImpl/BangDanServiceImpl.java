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
		if(bangDanDao.selectBangDanByDdbm(bd.getDdbm())==null)//这是先判断一下订单关联的磅单是否存在，不存在的话先生成。有些以前的老订单可能不存在磅单
			return bangDanDao.newErBangWaiJian(bd);
		else
			return bangDanDao.editErBangWaiJian(bd);
	}

	@Override
	public int newErBangWaiJian(BangDan bd) {
		// TODO Auto-generated method stub
		return bangDanDao.newErBangWaiJian(bd);
	}

}
